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
        HStack{
            showArrowUpDown(for: detailedViewModel.isPriceIncreased)
            Text(detailedViewModel.baseCurrency)
                .frame(width: 100)
            Text(detailedViewModel.exchangeCurrencyInfo)
            Text(detailedViewModel.tradeVolume)
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
