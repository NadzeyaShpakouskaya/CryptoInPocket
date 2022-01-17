//
//  MainViewViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/01/2022.
//

import Foundation

/// ViewModel contains the all information to setup MainView:
/// the images in tabbar, the titles for tabbar
class MainViewViewModel {
    var exchangeTabImage: String {
        "building.columns.fill"
    }
    
    var exchangeTitle: String {
        "Exchanges"
    }
    
    var currencyTabImage: String {
        "bitcoinsign.square.fill"
    }
    
    var currencyTitle: String {
        "Currencies"
    }

    var favoriteTabImage: String {
        "heart.circle.fill"
    }
    
    var favoriteTitle: String {
        "My favorite"
    }

    var searchingTabImage: String {
        "magnifyingglass.circle"
    }
    
    var searchingTitle: String {
        "Search"
    }

}
