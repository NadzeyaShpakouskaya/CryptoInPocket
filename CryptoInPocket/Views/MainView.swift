//
//  MainView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct MainView: View {
    init(){
        setUpTabBar()
    }
    
    var body: some View {
  
        
        TabView {
            ExchangesView(viewModel: ExchangesViewModel())
                .tabItem {
                    Image(systemName: "building.columns.fill")
                    Text("Exchanges")
                }
            CurrenciesView(viewModel: CurrenciesViewModel())
                .tabItem {
                    Image(systemName: "bitcoinsign.square.fill")
                    Text("Currencies")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("My favorite")
                }
            Searching()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("Search")
                }
        }
        .font(.headline)  
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
