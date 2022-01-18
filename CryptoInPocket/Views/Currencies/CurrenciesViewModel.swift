//
//  CurrenciesViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation
class CurrenciesViewModel: ObservableObject {
    @Published var loadedCurrencies: [DetailedCurrencyViewModel] = []
    
    @Published var isLoading = false
    
    let header = "Currencies"
    
    private let fetchSize = 20
    
    private(set) var hasReachedEnd = false
    private(set) var lastItem = 0
    
    var shouldNextPageLoad: Bool {
        !hasReachedEnd
    }
    
    var lastFetched: DetailedCurrencyViewModel? {
        loadedCurrencies.last
    }
    
    @MainActor
    private func fetchCurrenciesByPage() async {
       isLoading = true
        let  item = self.lastItem
        do {
            let currenciesData = try await NetworkManagerAsync.shared.fetchCurrenciesByPage(itemPerPage: fetchSize, lastFetched: item)
            hasReachedEnd = currenciesData.count < fetchSize
            currenciesData.forEach { currency in
                let currencyVM = DetailedCurrencyViewModel(currency)
                loadedCurrencies.append(currencyVM)
            }

            isLoading = false
            lastItem += fetchSize
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor func loadMoreCurrencies() async {
        guard shouldNextPageLoad else { return }
        await fetchCurrenciesByPage()
    }
}
