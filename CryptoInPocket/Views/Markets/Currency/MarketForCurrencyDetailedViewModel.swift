//
//  MarketForCurrencyDetailedViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

class MarketForCurrencyDetailedViewModel: ObservableObject {
    var id: String {
       UUID().uuidString
    }

    var exchange: String {
        market.exchangeId ?? "exchange n/a"
    }
    
    var priceInfo: String {
        "~\(Double.formatNumber(market.priceUnconverted ?? 0)) \(market.quoteAsset ?? "-")"
    }
    
    var isPriceIncreased: Bool {
        market.changeLastDay ?? 0 >= 0
    }
    
    var tradeVolume: String {
        "Volume:\n\(Double.formatNumber(market.volumeLastDay ?? 0))"
    }
    
    private var market: Market
    
    init(market: Market) {
        self.market = market
    }
}
