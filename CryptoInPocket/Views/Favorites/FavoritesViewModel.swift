//
//  FavoritesViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import Foundation

class FavoritesViewModel: ObservableObject {
    
    @Published var displayedExchanges: [String] = []
    @Published var displayedCurrencies: [String] = []
    
    init() {
        let data = LocalDataStorageManager.shared.loadData()
        self.displayedExchanges = data.exchangesNames.sorted()
        self.displayedCurrencies = data.currenciesNames.sorted()
    }
    
}
