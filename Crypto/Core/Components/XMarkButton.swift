//
//  XMarkButton.swift
//  Crypto
//
//  Created by Ravid Krisi on 24/10/2024.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

#Preview {
    XMarkButton()
}
