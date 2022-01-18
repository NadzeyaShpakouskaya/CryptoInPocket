//
//  LocalDataStorageManager.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import SwiftUI

class LocalDataStorageManager: ObservableObject {
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
    
    func fetchFavoriteCurrencies() -> [String] {
        loadData().currenciesNames
    }
    
    func fetchFavoriteExchanges() -> [String] {
        loadData().exchangesNames
    }
    
    func saveData(_ data: UserData) {
          userData = try? JSONEncoder().encode(data)
    }
    
    func saveSectionPresentedStatus(as status: Bool) {
        var data = loadData()
        data.isMarketsSectionHidden = status
        saveData(data)
    }
    
    func isFavoriteCurrency(with id: String) -> Bool {
        loadData().currenciesNames.contains(id)
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
    
    func deleteCurrencyFromFavorite(with id: String) {
        var data = loadData()
        guard let index = data.currenciesNames.firstIndex(of: id) else { return }
        data.currenciesNames.remove(at: index)
        saveData(data)
    }
    
    func isFavoriteExchange(with id: String) -> Bool {
        loadData().exchangesNames.contains(id)
    }
        
    func addToFavorite(exchange: Exchange) {
        var data = loadData()
        data.exchangesNames.append(exchange.exchangeId)
        saveData(data)
    }
    
    func addExchangeToFavoriteBy(id: String) {
        var data = loadData()
        data.exchangesNames.append(id)
        saveData(data)
    }

    func deleteExchangeFromFavorite(_ offsetIndex: IndexSet) {
        var data = loadData()
        data.exchangesNames.remove(atOffsets: offsetIndex)
        saveData(data)
    }
    
    func deleteExchangeFromFavorite(with id: String) {
        var data = loadData()
        guard let index = data.exchangesNames.firstIndex(of: id) else { return }
        data.exchangesNames.remove(at: index)
        saveData(data)
    }
}
