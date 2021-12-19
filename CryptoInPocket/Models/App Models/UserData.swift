//
//  UserData.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

struct UserData: Codable, Hashable {
    var exchangesNames: [String] = []
    var currenciesNames: [String] = []
    var isMarketsSectionHidden: Bool = false
}
