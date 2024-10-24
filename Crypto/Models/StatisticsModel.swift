//
//  StatisticsModel.swift
//  Crypto
//
//  Created by Ravid Krisi on 24/10/2024.
//

import Foundation

struct StatisticsModel: Identifiable {
    
    let id = UUID().uuidString
    let title: String
    let value: String
    let precentageChange: Double?
    
    init(title: String, value: String, precentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.precentageChange = precentageChange
    }
    
}
