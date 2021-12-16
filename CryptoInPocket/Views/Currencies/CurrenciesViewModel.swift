//
//  CurrenciesViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

@MainActor class CurrenciesViewModel: ObservableObject {
    @Published var currencies: [DetailedCurrencyViewModel] = []
    
    let header = "Currencies"
    
    func fetchCurrencies() async {
        currencies = []
        do {
            let currenciesData = try await NetworkManagerAsync.shared.fetchCurrencies()
            currenciesData.forEach { currency in
                let currencyVM = DetailedCurrencyViewModel(currency)
                currencies.append(currencyVM)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
}
