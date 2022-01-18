//
//  PercentageChangesView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 18/01/2022.
//

import SwiftUI

struct PercentageChangesView: View {
    let title: String
    let value: String
    let isIncreased: Bool
    
    var body: some View {
        VStack {
            Text(title)
            Text(value)
                .foregroundColor(isIncreased ? .green : .red)
        }
    }
}

struct PercentageChangesHorizontalView: View {
    let title: String
    let value: String
    let isIncreased: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Text(value)
                .foregroundColor(isIncreased ? .green : .red)
        }
    }
}

struct PercentageChangesView_Previews: PreviewProvider {
    static var previews: some View {
        PercentageChangesView(title: "Last hour", value: "2%", isIncreased: true)
        PercentageChangesHorizontalView(title: "Last day:", value: "23%", isIncreased: false)
    }
}
