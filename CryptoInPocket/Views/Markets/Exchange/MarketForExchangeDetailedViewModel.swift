//
//  MarketForExchangeDetailedViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

class MarketForExchangeDetailedViewModel: ObservableObject {
    var id: String {
        if let mark = market.exchangeId, let baseAsset = market.baseAsset, let quoteAsset = market.quoteAsset{
          return  mark + baseAsset + quoteAsset
        } else {
           return UUID().uuidString
        }
    }
    
    var baseCurrency: String {
        market.baseAsset ?? "n/a"
    }
    
    var exchangeCurrencyInfo: String {
        "~ \(Double.formatNumber(market.priceUnconverted ?? 0)) \(market.quoteAsset ?? "")"
    }
    
    var tradeVolume: String {
        "Volume:\n\(Double.formatNumber(market.volumeLastDay ?? 0))"
    }
    
    var isPriceIncreased: Bool {
        market.changeLastDay ?? 0 >= 0
    }
    
    private var market: Market
    
    init(market: Market){
        self.market = market
    }
}
