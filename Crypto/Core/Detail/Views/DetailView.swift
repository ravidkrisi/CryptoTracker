//
//  DetailView.swift
//  Crypto
//
//  Created by Ravid Krisi on 30/10/2024.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    @StateObject var vm: DetailViewModel
    
    init(coin: CoinModel) {
        self._vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        Text("hello")
    }
}

#Preview {
    DetailView(coin: DeveloperPreview.shared.coin)
}
