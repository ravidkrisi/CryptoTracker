//
//  StatisticsView.swift
//  Crypto
//
//  Created by Ravid Krisi on 24/10/2024.
//

import SwiftUI

struct StatisticsView: View {
    
    let stat: StatisticsModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: stat.precentageChange ?? 0 < 0 ? 180 : 0))
                Text(stat.precentageChange?.asPrecentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle(stat.precentageChange ?? 0 < 0 ? Color.theme.red : Color.theme.green)
            .opacity(stat.precentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticsView(stat: DeveloperPreview.shared.stat1)
    StatisticsView(stat: DeveloperPreview.shared.stat2)
    StatisticsView(stat: DeveloperPreview.shared.stat3)
}
