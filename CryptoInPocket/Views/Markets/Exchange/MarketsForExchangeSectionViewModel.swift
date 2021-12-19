//
//  MarketsForExchangeSectionViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

@MainActor class MarketsForExchangeSectionViewModel: ObservableObject {
    @Published var marketsForExchange: [MarketForExchangeDetailedViewModel] = []
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
 
    func fetchMarketsForExchange(with id: String) async {
        marketsForExchange = []
        do {
            let marketsData = try await NetworkManagerAsync.shared.fetchMarketsForExchange(id: id)
            marketsData.forEach { market in
                let marketVM = MarketForExchangeDetailedViewModel(market: market)
                marketsForExchange.append(marketVM)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}
