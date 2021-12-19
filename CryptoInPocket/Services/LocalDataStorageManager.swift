//
//  LocalDataStorageManager.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import SwiftUI

class LocalDataStorageManager {
    @AppStorage("userData") private var userData: Data?
    
    static let shared = LocalDataStorageManager()
    
    private init() {}
    
    func loadData() -> UserData {
        guard let data = try? JSONDecoder().decode(
                    UserData.self,
                    from: userData ?? Data()
        ) else { return UserData() }
        return data
    }
    
    func saveData(_ data: UserData) {
          userData = try? JSONEncoder().encode(data)
      }
    
    func saveSectionPresentedStatus(as status: Bool) {
        var data = loadData()
        data.isMarketsSectionHidden = status
        saveData(data)
    }
    
    func addToFavorite(currency: Currency) {
        var data = loadData()
        data.currenciesNames.append(currency.assetId)
        saveData(data)
    }
    func addCurrencyToFavoriteBy(id: String) {
        var data = loadData()
        data.currenciesNames.append(id)
        saveData(data)
    }
    
    func deleteCurrencyFromFavorite(_ offsetIndex: IndexSet) {
        var data = loadData()
        data.currenciesNames.remove(atOffsets: offsetIndex)
        saveData(data)
    }
    
    func addToFavorite(exchange: Exchange) {
        var data = loadData()
        data.exchangesNames.append(exchange.exchangeId)
        saveData(data)
    }
    
    func addToFavoriteExchangeBy(id: String) {
        var data = loadData()
        data.exchangesNames.append(id)
        saveData(data)
    }

    func deleteExchangeFromFavorite(_ offsetIndex: IndexSet) {
        var data = loadData()
        data.exchangesNames.remove(atOffsets: offsetIndex)
        saveData(data)
    }
}
