//
//  MarketsForCurrencySectionViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

@MainActor class MarketsForCurrencySectionViewModel: ObservableObject {
    @Published var markets: [MarketForCurrencyDetailedViewModel] = []
    @Published var isMarketsSectionHidden: Bool = false
    
    
    //TO DO: - read status market section from userDefaults
    
    var headerTitle: String {
        "Markets"
    }
    
    var buttonTitle: String {
        isMarketsSectionHidden ? "Show" : "Hide"
    }
    
    func hideMarketsButtonPressed(){
        isMarketsSectionHidden.toggle()
        //TO DO: - save status market section in userDefaults
    }
    
 
    func fetchMarketsForCurrency(with id: String) async {
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
