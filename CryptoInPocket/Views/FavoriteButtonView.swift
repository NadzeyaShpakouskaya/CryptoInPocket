//
//  FavoriteButtonView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 21/12/2021.
//

import SwiftUI

struct FavoriteButtonView: View {
    let color: Color
    let isFavorite: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill" )
                .foregroundColor(isFavorite ? color : .gray)
        }
    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(color: .orange, isFavorite: true, action: {})
    }
}
