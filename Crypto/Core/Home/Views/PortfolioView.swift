//
//  PortfolioView.swift
//  Crypto
//
//  Created by Ravid Krisi on 24/10/2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantityText: String = ""
    @State private var showCheckMark: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar() {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
                
                if !quantityText.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        trailingNavBarButton
                    }
                }
            }
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.shared.homeVM)
}

extension PortfolioView {
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.theme.green, lineWidth: 1)
                                .opacity(selectedCoin != nil && coin == selectedCoin ? 1.0 : 0.0)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        }
    }
    
    private func getCurrentValue() -> Double {
        (Double(quantityText) ?? 0) * (selectedCoin?.currentPrice ?? 0)
    }
    
    private var portfolioInputSection: some View {
            VStack(spacing: 20) {
                HStack {
                    Text("current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                    Spacer()
                    Text(selectedCoin?.currentPrice.asCurrenctWith6Decimals() ?? "")
                }
                Divider()
                HStack {
                    Text("amount in your portfolio")
                    Spacer()
                    TextField("Ex: 1.4", text: $quantityText)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
                Divider()
                HStack {
                    Text("Current value:")
                    Spacer()
                    Text(getCurrentValue().asCurrenctWith2Decimals())
                }
            }
            .animation(.none, value: selectedCoin)
            .padding()
            .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        HStack {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            Button {
                saveButtonPressed()
            } label: {
                Text("Save".uppercased())
                    .opacity(selectedCoin != nil && selectedCoin?.currentHoldings != Double(quantityText) ?? 0 ? 1.0 : 0.0)
            }
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        guard let coin = selectedCoin else { return }
        
        // save to portfolio
        
        // show the checkmark
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showCheckMark = false
        }
        
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchText = ""
    }
}
