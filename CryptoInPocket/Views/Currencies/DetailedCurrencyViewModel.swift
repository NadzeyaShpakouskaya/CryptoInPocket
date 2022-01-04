//
//  DetailedCurrencyViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import Foundation

class DetailedCurrencyViewModel: ObservableObject {
    
    @Published var isFavorite: Bool {
        didSet {
            if oldValue {
                LocalDataStorageManager.shared.deleteCurrencyFromFavorite(with: currency.assetId)
            } else {
                LocalDataStorageManager.shared.addCurrencyToFavoriteBy(id: currency.assetId)
            }
        }
    }
    
    
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
    
    private var currency: Currency
    
    init(_ currency: Currency) {
        self.currency = currency
        isFavorite = LocalDataStorageManager.shared.loadData().currenciesNames.contains(currency.assetId)
    }
    
    
    func favoriteButtonPressed(){
        isFavorite.toggle()
    }
    
    
}
