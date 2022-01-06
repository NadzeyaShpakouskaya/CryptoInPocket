//
//  FavoritePopUpCurrencyViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 06/01/2022.
//

import Foundation

class FavoritePopUpCurrencyViewModel: ObservableObject {
    @Published var favoriteVMExchanges: [MarketForCurrencyDetailedViewModel] = []
    
    var currencyId: String {
        currency.assetId
    }
    
    var currencyName: String {
        currency.name ?? currency.assetId
    }
    
    var currencyDetailed: String {
        "\(currencyName) (\(currencyId))"
    }
    
    var priceInfo: String {
        "Price: $ \(Double.formatNumber(currency.price ?? 0))"
    }
    
    var tradingVolumeInfo: String {
        "Volume 24h: \(Double.formatNumber(currency.volumeLastDay ?? 0))"
    }
    
    var lastHourChangesTitle: String {
        "Last hour:"
    }
    var lastHourChangesValue: String {
        let value = currency.changeLastHour ?? 0 * 100.0
        return "\(Double.formatNumber(value))%"
    }
    
    var isLastHourValueIncreased: Bool {
        currency.changeLastHour ?? 0 >= 0
    }
    
    var lastDayChangesTitle: String {
        "Last day:"
    }
    
    var lastDayChangesValue: String {
        let value = currency.changeLastDay ?? 0 * 100.0
        return "\(Double.formatNumber(value))%"
    }
    
    var isLastDayValueIncreased: Bool {
        currency.changeLastDay ?? 0 >= 0
    }
    
    var lastWeekChangesTitle: String {
        "Last week:"
    }
    var lastWeekChangesValue: String {
        let value = currency.changeLastWeek ?? 0 * 100.0
        return "\(Double.formatNumber(value))%"
    }
    
    var isLastWeekValueIncreased: Bool {
        currency.changeLastWeek ?? 0 >= 0
    }
    
    var titleForExchanges: String {
        "Check your favorite exchanges"
    }
    
    private var currency: Currency
    
    init(_ currency: Currency) {
        self.currency = currency
  
    }
    
    @MainActor
    func fetchFavoriteMarkets() async {
        favoriteVMExchanges = []
        let favoriteExchanges = LocalDataStorageManager.shared.fetchFavoriteExchanges()
        do {
            let marketsData = try await NetworkManagerAsync.shared.fetchMarketsForCurrency(id: currencyId)
            var markets = [Market]()
            
            for market in marketsData {
                for exchange in favoriteExchanges {
                    if market.exchangeId == exchange {
                        markets.append(market)
                    }
                }
            }
            
            markets.sort { $0.exchangeId ?? "" < $1.exchangeId ?? "" }
            for favorite in markets {
                favoriteVMExchanges.append(MarketForCurrencyDetailedViewModel(market: favorite))
            }
           
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
