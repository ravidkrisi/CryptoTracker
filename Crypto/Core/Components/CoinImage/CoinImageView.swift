//
//  CoinImageView.swift
//  Crypto
//
//  Created by Ravid Krisi on 23/10/2024.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    var body: some View {
        if let image = vm.image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else if vm.isLoading {
            ProgressView()
        } else {
            Image(systemName: "questionmark")
                .foregroundStyle(Color.theme.secondryText)
        }
        
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.shared.coin)
}
