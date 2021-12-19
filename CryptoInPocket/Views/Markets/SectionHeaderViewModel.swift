//
//  SectionHeaderViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 19/12/2021.
//

import Foundation

class SectionHeaderViewModel: ObservableObject {
    var headerTitle: String {
        "Markets"
    }
    
    var buttonTitle: String {
        isMarketsHidden ? "Show": "Hide"
    }

    
    private var isMarketsHidden: Bool
    
    init() {
        isMarketsHidden = LocalDataStorageManager.shared.loadData().isMarketsSectionHidden
    }
}
