//
//  Exchange.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

/// The model based on API GET https://www.cryptingup.com/api/exchanges
struct Exchange: Codable, Hashable {
    let exchangeId: String
    let name: String?
    let website: String?
    let volumeLastDay: Double?
}

// MARK: - Coding Keys
extension Exchange {
    enum CodingKeys: String, CodingKey {
        case exchangeId = "exchange_id"
        case name
        case website
        case volumeLastDay = "volume_24h"
    }
}
// MARK: - Test data
extension Exchange {
    
    static func getTestExchange() -> Exchange {
        Exchange(exchangeId: "Test",
                 name: "Some Test Exchange",
                 website: "https://www.google.com",
                 volumeLastDay: 123456.98)
    }
    
    static func getEmptyExchange() -> Exchange {
        Exchange(exchangeId: "",
                 name: "",
                 website: "https://google.com",
                 volumeLastDay: 0.0)
    }
    
    static func getTestExchanges() -> [Exchange] {
        [
            Exchange(exchangeId: "BINANCE", name: "Binance", website: "https://www.binance.com", volumeLastDay: 36052149854.27475),
            Exchange(exchangeId: "HUOBIGLOBAL", name: "Huobi Global", website: "https://www.huobi.com", volumeLastDay: 12345357456.98),
            Exchange(exchangeId: "COINBASE", name: "Coinbase", website: "https://pro.coinbase.com", volumeLastDay: 8058319118.753507),
        ]
    }
}

struct AllExchangesDescription: Codable {
    let exchanges: [Exchange]
}

struct RemoteExchange: Codable {
    let exchange: Exchange
}
