//
//  MarketForExchangeDetailedView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct MarketForExchangeDetailedView: View {
    @ObservedObject var detailedViewModel: MarketForExchangeDetailedViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            showArrowUpDown(for: detailedViewModel.isPriceIncreased)
            Text(detailedViewModel.baseCurrency)
                .bold()
                .font(.subheadline)
                .frame(width: 75, alignment: .leading)
            Text(detailedViewModel.exchangeCurrencyInfo)
                .font(.subheadline)
                .frame(alignment: .leading)
            Spacer()
            Text(detailedViewModel.tradeVolume)
                .font(.footnote)
                .frame(width: 50)
        }
    }
}

struct MarketForExchangeDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MarketForExchangeDetailedView(
            detailedViewModel: MarketForExchangeDetailedViewModel(market: Market.getTestMarket())
        )
    }
}
