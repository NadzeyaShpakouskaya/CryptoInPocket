//
//  Currency.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

/// The model based on API GET https://www.cryptingup.com/api/assets
struct Currency: Codable, Hashable {
    let assetId: String
    let name: String?
    let description: String?
    let price: Double?
    let volumeLastDay: Double?
    let changeLastHour: Double?
    let changeLastDay: Double?
    let changeLastWeek: Double?
    let status: String?
    let createdAt: String?
    let updatedAt: String?
}

// MARK: - Coding Keys
extension Currency {
    enum CodingKeys: String, CodingKey {
        case assetId = "asset_id"
        case name
        case price
        case description
        case volumeLastDay = "volume_24h"
        case changeLastHour = "change_1h"
        case changeLastDay = "change_24h"
        case changeLastWeek = "change_7d"
        case status
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct AllCurrenciesDescription: Codable {
    let assets: [Currency]
}

struct RemoteCurrency: Codable {
    let asset: Currency
}

struct AssetsData: Codable {
    let assets: [AssetData]
}

struct AssetData: Codable {
    let assetId: String
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case assetId = "asset_id"
        case name
    }
}

// MARK: - Test Data
extension Currency {
    static func getTestCurrency() -> Currency {
        Currency(assetId: "USDT",
                 name: "Tether",
                 description: "Bitcoin uses peer-to-peer technology to operate with no central authority or banks; managing transactions and the issuing of bitcoins is carried out collectively by the network.\r\nBitcoin is open-source; its design is public, nobody owns or controls Bitcoin and everyone can take part. Through many of its unique properties, Bitcoin allows exciting uses that could not be covered by any previous payment system.",
                 price: 1.0001452718521675,
                 volumeLastDay: 35389562234.59391,
                 changeLastHour: -0.020511090129785286,
                 changeLastDay: 0.0033725872157232663,
                 changeLastWeek: 0.0033725872157232663,
                 status: "recent",
                 createdAt: "2021-09-20T23:47:33",
                 updatedAt: "2021-09-21T00:49:14"
        )
    }
    
    static func getEmptyCurrency() -> Currency {
        Currency(assetId: "",
                 name: "",
                 description: "",
                 price: 0.0,
                 volumeLastDay: 0.0,
                 changeLastHour: 0.0,
                 changeLastDay: 0.0,
                 changeLastWeek: 0.0,
                 status: "recent",
                 createdAt: "2021-09-20T23:47:33",
                 updatedAt: "2021-09-21T00:49:14"
        )
    }
    
    static func getTestCurrencies() -> [Currency] {
        [
            Currency(assetId: "USDT",
                     name: "Tether",
                     description: "Bitcoin uses peer-to-peer technology to operate with no central authority or banks; managing transactions and the issuing of bitcoins is carried out collectively by the network.\r\nBitcoin is open-source; its design is public, nobody owns or controls Bitcoin and everyone can take part. Through many of its unique properties, Bitcoin allows exciting uses that could not be covered by any previous payment system.",
                     price: 1.0001452718521675,
                     volumeLastDay: 35389562234.59391,
                     changeLastHour: -0.020511090129785286,
                     changeLastDay: 0.0033725872157232663,
                     changeLastWeek: 0.0033725872157232663,
                     status: "recent",
                     createdAt: "2021-09-20T23:47:33",
                     updatedAt: "2021-09-21T00:49:14"
                    ),
            Currency(assetId: "XRP",
                     name: "Ripple",
                     description: "Bitcoin uses peer-to-peer technology to operate with no central authority or banks; managing transactions and the issuing of bitcoins is carried out collectively by the network.\r\nBitcoin is open-source; its design is public, nobody owns or controls Bitcoin and everyone can take part. Through many of its unique properties, Bitcoin allows exciting uses that could not be covered by any previous payment system.",
                     price: 1.8901452718521675,
                     volumeLastDay: 19562234.59391,
                     changeLastHour: -0.020511090129785286,
                     changeLastDay: 0.0033725872157232663,
                     changeLastWeek: 0.0033725872157232663,
                     status: "recent",
                     createdAt: "2021-09-20T23:47:33",
                     updatedAt: "2021-09-21T00:49:14"
                    )
        ]
    }
}
