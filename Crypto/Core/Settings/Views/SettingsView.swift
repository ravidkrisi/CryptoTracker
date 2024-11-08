//
//  SettingsView.swift
//  Crypto
//
//  Created by Ravid Krisi on 04/11/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/ravidkrisi")!
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                
                List {
                    infoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
                .scrollContentBackground(.hidden)
                .font(.headline)
                .tint(.blue)
                .listStyle(.grouped)
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    xMarkButton
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

extension SettingsView {
    
    private var xMarkButton: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
    
    private var infoSection: some View {
        Section("Crypto Tracker") {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                
                Text("this app was made following YouTube course.")
            }
            .padding(.vertical)
            Link("check my GitHub", destination: personalURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section("CoinGecko") {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(.rect(cornerRadius: 20))
                
                Text("this app was made following YouTube course.")
            }
            .padding(.vertical)
            Link("check coin gecko API", destination: coingeckoURL)
        }
    }
}
