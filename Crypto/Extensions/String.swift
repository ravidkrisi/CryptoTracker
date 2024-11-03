//
//  String.swift
//  Crypto
//
//  Created by Ravid Krisi on 04/11/2024.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
