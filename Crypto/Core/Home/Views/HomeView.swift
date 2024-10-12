//
//  HomeView.swift
//  Crypto
//
//  Created by Ravid Krisi on 11/10/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
            
            VStack {
                HStack {
                    CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                        .animation(.none, value: showPortfolio)
                        .background(
                            CircleButtonAnimationView(animate: $showPortfolio)
                        )
                    
                    Spacer()
                    
                    Text(showPortfolio ? "Portfolio" : "Live Prices")
                        .font(.headline)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.theme.accent)
                        .animation(.none, value: showPortfolio)
                    
                    Spacer()
                    
                    CircleButtonView(iconName: "chevron.right")
                        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showPortfolio.toggle()
                            }
                        }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
