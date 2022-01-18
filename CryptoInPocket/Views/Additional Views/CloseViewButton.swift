//
//  CloseViewButton.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 18/01/2022.
//

import SwiftUI

struct CloseViewButton: View {
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .foregroundColor(color)
        }
    }
}

struct CloseViewButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseViewButton(color: .gray, action: {})
    }
}
