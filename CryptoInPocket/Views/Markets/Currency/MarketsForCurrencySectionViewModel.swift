//
//  MarketsForCurrencySectionViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

class MarketsForCurrencySectionViewModel: ObservableObject {
    @Published var markets: [MarketForCurrencyDetailedViewModel] = []
    @Published var isMarketsSectionHidden: Bool  {
        didSet {
            LocalDataStorageManager.shared.saveSectionPresentedStatus(as: isMarketsSectionHidden)
        }
    }
    
    init() {
        isMarketsSectionHidden = LocalDataStorageManager.shared.loadData().isMarketsSectionHidden
    }

    func hideMarketsButtonPressed(){
        isMarketsSectionHidden.toggle()
    }
    
    @MainActor func fetchMarketsForCurrency(with id: String) async {
        markets = []
        do {
            let marketsData = try await NetworkManagerAsync.shared.fetchMarketsForCurrency(id: id)
                .filter{ $0.quoteAsset != id }
            marketsData.forEach { market in
                let marketVM = MarketForCurrencyDetailedViewModel(market: market)
                markets.append(marketVM)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}
