//
//  Color.swift
//  Crypto
//
//  Created by Ravid Krisi on 11/10/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ThemeColor()
}

struct ThemeColor {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondryText = Color("SecondryTextColor")
}
