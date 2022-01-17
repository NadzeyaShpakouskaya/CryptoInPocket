//
//  MainView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct MainView: View {
    let viewModel: MainViewViewModel
    
    init(viewModel: MainViewViewModel){
        self.viewModel = viewModel
        setUpTabBar()
        setUpNavigationBar()
    }
    
    var body: some View {
        NavigationView {
            TabView {
                ExchangesView(viewModel: ExchangesViewModel())
                    .tabItem {
                        Image(systemName: viewModel.exchangeTabImage)
                        Text(viewModel.exchangeTitle)
                    }
                CurrenciesView(viewModel: CurrenciesViewModel())
                    .tabItem {
                        Image(systemName: viewModel.currencyTabImage)
                        Text(viewModel.currencyTitle)
                    }
                FavoritesView()
                    .tabItem {
                        Image(systemName: viewModel.favoriteTabImage)
                        Text(viewModel.favoriteTitle)
                    }
                Searching()
                    .tabItem {
                        Image(systemName: viewModel.searchingTabImage)
                        Text(viewModel.searchingTitle)
                    }
            }
            .font(.headline)
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewViewModel())
    }
}
