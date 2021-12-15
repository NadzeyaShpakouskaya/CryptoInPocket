//
//  View+Extension.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

extension View {
    func showArrowUpDown(for value: Double) -> some View {
        Image(systemName: value > 0 ? "arrow.up" : "arrow.down")
            .foregroundColor(value > 0 ? .green : .red)
    }
    
    func showPriceChangesInPercent(for periodTitle: String, and value: Double) -> some View {
        VStack{
            Text(periodTitle)
            Text(Double.formatNumber(value) + "%")
                .foregroundColor(value >= 0 ? .green : .red)
        }
    }
}

