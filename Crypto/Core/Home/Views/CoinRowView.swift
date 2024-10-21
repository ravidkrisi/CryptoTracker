//
//  CoinRowView.swift
//  Crypto
//
//  Created by Ravid Krisi on 18/10/2024.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.shared.coin)
}
