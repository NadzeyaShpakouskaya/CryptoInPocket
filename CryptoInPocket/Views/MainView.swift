//
//  MainView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ExchangesView()
                .tabItem {
                    Image(systemName: "building.columns.fill")
                    Text("Exchanges")
                }
            CurrenciesView()
                .tabItem {
                    Image(systemName: "bitcoinsign.square.fill")
                    Text("Currencies")
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.circle.fill")
                    Text("My favorite")
                }
        }
        .font(.headline)
        // disable transparent toolbar in ios 15.0+
        .onAppear {
            if #available(iOS 15.0, *) {
                let appearance = UITabBarAppearance()
                UITabBar.appearance().scrollEdgeAppearance = appearance
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
