//
//  Double.swift
//  Crypto
//
//  Created by Ravid Krisi on 22/10/2024.
//

import Foundation

extension Double {
    
    /// converts a Double to currency with 2 decimal digits
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.34
    /// Convert 0.123456 to $0.12
    /// ```
    private var currenctFormmater2: NumberFormatter {
        let formmater = NumberFormatter()
        formmater.usesGroupingSeparator = true
        formmater.numberStyle = .currency
        formmater.minimumFractionDigits = 2
        formmater.maximumFractionDigits = 2
        return formmater
    }
    
    /// converts a Double to currency as a String with 2-6 decimal digits
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.34"
    /// Convert 0.123456 to " $0.12"
    /// ```
    func asCurrenctWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currenctFormmater2.string(from: number) ?? "0.00$"
    }
    
    /// converts a Double to currency with 2-6 decimal digits
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currenctFormmater6: NumberFormatter {
        let formmater = NumberFormatter()
        formmater.usesGroupingSeparator = true
        formmater.numberStyle = .currency
        formmater.minimumFractionDigits = 2
        formmater.maximumFractionDigits = 6
        return formmater
    }
    
    /// converts a Double to currency as a String with 2-6 decimal digits
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to " $0.123456"
    /// ```
    func asCurrenctWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currenctFormmater6.string(from: number) ?? "0.00$"
    }
    
    /// converts a Double to a String representation
    /// ```
    /// Convert 1.2345 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// converts a Double to a String representation
    /// ```
    /// Convert 1.2345 to "1.23%"
    /// ```
    func asPrecentString() -> String {
        asNumberString() + "%"
    }
}
