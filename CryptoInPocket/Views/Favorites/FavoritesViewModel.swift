//
//  FavoritesViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    var favoriteExchangesNames: [String] {
        LocalDataStorageManager.shared.loadData().exchangesNames
    }
    var favoriteCurrenciesNames: [String] {
        LocalDataStorageManager.shared.loadData().currenciesNames
    }

    
    @Published var selectedExchange: DetailedExchangeViewModel?
    @Published var selectedCurrency: DetailedCurrencyViewModel?
    
    var mainHeader: String {
        "Favorites"
    }
    
    var exchangesSectionHeader: String {
        "My Exchanges"
    }
    
    var currenciesSectionHeader: String {
        "My currencies"
    }
    
    
    @MainActor func fetchCurrencyWith(id: String) async {
        selectedCurrency = nil
        do {
            let currency = try await NetworkManagerAsync.shared.fetchCurrencyBy(id: id)
            selectedCurrency = DetailedCurrencyViewModel(currency)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor func fetchExchangeWith(id: String) async {
        selectedExchange = nil
        do {
            let exchange = try await NetworkManagerAsync.shared.fetchExchangeBy(id: id)
            selectedExchange = DetailedExchangeViewModel(exchange: exchange)
        } catch {
            print(error.localizedDescription)
        }
    }
}
