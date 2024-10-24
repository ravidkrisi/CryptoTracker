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
        formmater.currencyCode = "usd" // <- change currency
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
        formmater.currencyCode = "usd" // <- change currency
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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
    /// ```
    /// Convert 12 to 12.00
    /// Convert 1234 to 1.23K
    /// Convert 123456 to 123.45K
    /// Convert 12345678 to 12.34M
    /// Convert 1234567890 to 1.23Bn
    /// Convert 123456789012 to 123.45Bn
    /// Convert 12345678901234 to 12.34Tr
    /// ```
    func formattedWithAbbreviations() -> String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumberString()
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.asNumberString()

        default:
            return "\(sign)\(self)"
        }
    }
}
