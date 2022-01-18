//
//  Market.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation
/// The model based on api GET https://www.cryptingup.com/api/markets
struct Market: Codable, Hashable {    
    let exchangeId: String?
    let symbol: String?
    let baseAsset: String?
    let quoteAsset: String?
    let priceUnconverted: Double?
    let price: Double?
    let changeLastDay: Double?
    let spread: Double?
    let volumeLastDay: Double?
    let status: String?
    let createdAt: String?
    let updatedAt: String?
    
}

struct AllMarketsDescription: Codable {
    let markets: [Market]
    let next: String
    
    enum CodingKeys: String, CodingKey {
        case markets, next
    }
}

// MARK: - Coding Keys
extension Market {
    
    enum CodingKeys: String, CodingKey {
        case exchangeId =  "exchange_id"
        case symbol
        case baseAsset =  "base_asset"
        case quoteAsset = "quote_asset"
        case priceUnconverted = "price_unconverted"
        case price
        case changeLastDay = "change_24h"
        case spread
        case volumeLastDay = "volume_24h"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Test Data
extension Market {
    static func getTestMarket() -> Market {
        Market(exchangeId: "COINBASE",
               symbol: "ETH-USD",
               baseAsset: "ETH",
               quoteAsset: "USD",
               priceUnconverted: 2906.5150000000003,
               price: 2906.5150000000003,
               changeLastDay: -11.5059888808374,
               spread: 0.018233234025285715,
               volumeLastDay: 1352009908.7926917,
               status: "recent",
               createdAt: "2021-09-20T23:47:33",
               updatedAt: "2021-09-21T00:47:14")
    }
    
    static func getTestMarkets() -> [Market] {
        [
            Market(exchangeId: "COINBASE",
                   symbol: "ETH-USD",
                   baseAsset: "ETH",
                   quoteAsset: "USD",
                   priceUnconverted: 2906.5150000000003,
                   price: 2906.5150000000003,
                   changeLastDay: -11.5059888808374,
                   spread: 0.018233234025285715,
                   volumeLastDay: 1352009908.7926917,
                   status: "recent",
                   createdAt: "2021-09-20T23:47:33",
                   updatedAt: "2021-09-21T00:47:14"),
            Market(exchangeId: "COINBASE",
                   symbol: "BTC-USD",
                   baseAsset: "BTC",
                   quoteAsset: "USD",
                   priceUnconverted: 52906.5150000000003,
                   price: 52906.5150000000003,
                   changeLastDay: -11.5059888808374,
                   spread: 0.018233234025285715,
                   volumeLastDay: 1352009908.7926917,
                   status: "recent",
                   createdAt: "2021-09-20T23:47:33",
                   updatedAt: "2021-09-21T00:47:14"),
            Market(exchangeId: "COINBASE",
                   symbol: "XRP-USD",
                   baseAsset: "XRP",
                   quoteAsset: "USD",
                   priceUnconverted: 2.5150000000003,
                   price: 2.5150000000003,
                   changeLastDay: -0.5059888808374,
                   spread: 0.018233234025285715,
                   volumeLastDay: 1352009908.7926917,
                   status: "recent",
                   createdAt: "2021-09-20T23:47:33",
                   updatedAt: "2021-09-21T00:47:14")
        ]
    }
}
