//
//  LaunchView.swift
//  Crypto
//
//  Created by Ravid Krisi on 06/11/2024.
//

import SwiftUI

struct LaunchView: View {
    
    @State private var loadingText: [String] = "Loading your portfolio...".map({ String($0) })
    @State private var showLoadingText: Bool = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        ZStack {
            Color.launch.background
            
            Image("logo-transparent")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color.launch.accent)
                                .offset(y: (counter % loadingText.count) == index ? -5 : 0)
                        }
                    }
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            showLoadingText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                counter += 1
            }
        })
        .ignoresSafeArea()
    }
}

#Preview {
    LaunchView()
}
