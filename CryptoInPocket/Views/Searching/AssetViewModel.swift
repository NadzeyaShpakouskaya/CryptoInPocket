//
//  AssetViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 10/01/2022.
//

import Foundation

class AssetViewModel: ObservableObject {

    var info: String {
        guard let name = currency.name, !name.isEmpty else { return currency.assetId }
        return "\(currency.assetId) - \(currency.name ?? "")"
    }
    
    var id: String {
        currency.assetId
    }
    
    init(data: AssetData) {
        self.currency = data
    }
    
    private var currency: AssetData
}
