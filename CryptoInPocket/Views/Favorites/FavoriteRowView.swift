//
//  FavoriteRowView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 05/01/2022.
//

import SwiftUI

struct FavoriteRowView: View {
    let title: String
    let color: Color
    
    var body: some View{
        HStack{
            Text(title)
                .multilineTextAlignment(.leading)
            Spacer()
            Image(systemName: "info")
                .foregroundColor(color)
        }.contentShape(Rectangle())
        
    }
}

struct FavoriteRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRowView(title: "Exchange", color: .indigo)
    }
}
