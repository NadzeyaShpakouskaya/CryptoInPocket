//
//  FavoritesViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    @Published  var favoriteExchangesNames: [String]  = []
    @Published var favoriteCurrenciesNames: [String] = []
    
    @Published var selectedExchange: FavoritePopUpExchangeViewModel?
    @Published var selectedCurrency: FavoritePopUpCurrencyViewModel?
    
    init() {
        loadFavoritesInfo()
    }
    
    var mainHeader: String {
        "Favorites"
    }
    
    var exchangesSectionHeader: String {
        "My Exchanges"
    }
    
    var currenciesSectionHeader: String {
        "My currencies"
    }
    
    
    
    @MainActor
    func fetchCurrencyWith(id: String) async {
        selectedCurrency = nil
        do {
            let currency = try await NetworkManagerAsync.shared.fetchCurrencyBy(id: id)
            selectedCurrency = FavoritePopUpCurrencyViewModel(currency)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func fetchExchangeWith(id: String) async {
        selectedExchange = nil
        do {
            let exchange = try await NetworkManagerAsync.shared.fetchExchangeBy(id: id)
            selectedExchange = FavoritePopUpExchangeViewModel(exchange: exchange)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteCurrencyFromFavorites(_ offsetIndex: IndexSet ) {
        LocalDataStorageManager.shared.deleteCurrencyFromFavorite(offsetIndex)
        favoriteCurrenciesNames = LocalDataStorageManager.shared.fetchFavoriteCurrencies()
    }
    
    func deleteExchangeFromFavorites(_ offsetIndex: IndexSet ) {
        LocalDataStorageManager.shared.deleteExchangeFromFavorite(offsetIndex)
        favoriteExchangesNames = LocalDataStorageManager.shared.fetchFavoriteExchanges()
    }
    
    func loadFavoritesInfo() {
        favoriteExchangesNames = LocalDataStorageManager.shared.fetchFavoriteExchanges()
        favoriteCurrenciesNames = LocalDataStorageManager.shared.fetchFavoriteCurrencies()
    }
    
    
}
