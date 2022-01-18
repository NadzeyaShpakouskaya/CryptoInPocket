//
//  FavoritePopUpExchangeViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 05/01/2022.
//

import Foundation

class FavoritePopUpExchangeViewModel: ObservableObject {
    @Published var favoriteCurrencies: [MarketForExchangeDetailedViewModel] = []
    
    var exchangeID: String {
        exchange.exchangeId
    }
    
    var exchangeName: String {
        exchange.name ?? exchange.exchangeId.capitalized
    }
    
    var tradingLabelText: String {
        "Trading volume last 24h:"
    }
    
    var valueTradingText: String {
        "\(Double.formatNumber(exchange.volumeLastDay  ?? 0.0))"
    }
    
    var titleForSiteLink: String {
        "Go to \(exchange.name ?? "") site"
    }
    
    var urlForSiteLink: URL {
        URL(
            string: exchange.website != nil
            ? exchange.website!
            : "https://google.com")!
    }
    
    var titleForCurrencies: String {
        "Check your favorite currencies"
    }
    
    private var exchange: Exchange
    
    init(exchange: Exchange) {
        self.exchange = exchange
    }
    
    @MainActor
    func fetchFavoriteMarketsForExchange() async {
        favoriteCurrencies = []
        let favoritesCurrencies = LocalDataStorageManager.shared.fetchFavoriteCurrencies()
        do {
            let marketsData = try await NetworkManagerAsync.shared.fetchMarketsForExchange(id: exchangeID)
            var filteredMarkets = [Market]()
            for market in marketsData {
                for currency in favoritesCurrencies where market.baseAsset == currency {
                        filteredMarkets.append(market)
                }
            }
            filteredMarkets.sort {$0.baseAsset ?? "" <= $1.baseAsset ?? ""}
            for favorite in filteredMarkets {
                favoriteCurrencies.append(MarketForExchangeDetailedViewModel(market: favorite))
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
