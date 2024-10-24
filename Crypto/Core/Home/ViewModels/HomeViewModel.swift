//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Ravid Krisi on 22/10/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticsModel] = [
        StatisticsModel(title: "title", value: "value", precentageChange: 1.0),
        StatisticsModel(title: "title", value: "value"),
        StatisticsModel(title: "title", value: "value"),
        StatisticsModel(title: "title", value: "value", precentageChange: -7.0)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    private let dataService = CoinDataService()
    
    init() {
        addSubsricbers()
    }
    
    func addSubsricbers() {
        // updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return coins }
        
        let lowercasedText = text.lowercased()
        return coins.filter { coin in
            return coin.name.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
}
