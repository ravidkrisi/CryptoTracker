//
//  UIApplication.swift
//  Crypto
//
//  Created by Ravid Krisi on 23/10/2024.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
