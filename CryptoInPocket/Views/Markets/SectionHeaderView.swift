//
//  SectionHeaderView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import SwiftUI

struct SectionHeaderView: View {
    let headerTitle: String
    let buttonTitle: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        HStack{
            Text(headerTitle)
            Spacer()
            Button(buttonTitle, action: action)
        }
        .frame(height: 40)
        .foregroundColor(color)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(headerTitle: "Markets", buttonTitle: "Hide", color: .orange, action: {})
    }
}
