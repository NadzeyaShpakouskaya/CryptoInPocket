//
//  MarketForCurrencyDetailedView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct MarketForCurrencyDetailedView: View {
    @ObservedObject var detailedVM: MarketForCurrencyDetailedViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            showArrowUpDown(for: detailedVM.isPriceIncreased)
            Text(detailedVM.exchange)
                .bold()
                .font(.subheadline)
                .frame(width: 110, alignment: .leading)
            Text(detailedVM.priceInfo)
                .font(.subheadline)
                .frame(alignment: .leading)
            Spacer()
            Text(detailedVM.tradeVolume)
                .font(.footnote)
                .frame(width: 50)
            }
    }
}

struct MarketForCurrencyDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MarketForCurrencyDetailedView(detailedVM: MarketForCurrencyDetailedViewModel(market: Market.getTestMarket()))
    }
}
