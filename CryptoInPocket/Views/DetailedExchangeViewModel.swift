//
//  DetailedExchangeViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

class DetailedExchangeViewModel: ObservableObject {
    
    
    var exchangeID: String {
        exchange.exchangeId
    }
    
    var exchangeName: String {
        exchange.name ?? exchange.exchangeId.capitalized
    }
    
    var tradingLabelText: String {
        "Trading volume last 24h:"
    }
    
    var valueTradingText: String {
        "\(Double.formatNumber(exchange.volumeLastDay  ?? 0.0))"
    }
    
    var titleForSiteLink: String {
        "Go to \(exchange.name ?? "") site"
    }
    
    var urlForSiteLink: URL {
        URL(
            string: exchange.website != nil
            ? exchange.website!
            : "https://google.com")!
    }
 
    private var exchange: Exchange
    
    init(exchange: Exchange){
        self.exchange = exchange
    }
}
