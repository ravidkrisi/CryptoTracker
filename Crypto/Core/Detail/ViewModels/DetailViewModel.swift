//
//  DetailViewModel.swift
//  Crypto
//
//  Created by Ravid Krisi on 30/10/2024.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    
    private var cancellables = Set<AnyCancellable>()
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print("received coin detail data \(returnedCoinDetails)")
            }
            .store(in: &cancellables)
    }
}
