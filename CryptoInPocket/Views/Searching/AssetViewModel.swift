//
//  AssetViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 10/01/2022.
//

import Foundation

class AssetViewModel: ObservableObject  {

    
    var info: String {
        if currency.name != "" {
            return  "\(currency.assetId) - \(currency.name ?? "")"
        } else {
            return currency.assetId
        }
    }
    
    var id: String {
        currency.assetId
    }
    
    init(data: AssetData) {
        self.currency = data
    }
    
    private var currency: AssetData
}
