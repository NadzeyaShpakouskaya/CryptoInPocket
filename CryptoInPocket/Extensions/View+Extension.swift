//
//  View+Extension.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

extension View {
    /// show  green up(red down) arrow image depends on changes of Bool parameter
    func showArrowUpDown(for value: Bool) -> some View {
        Image(systemName: value ? "arrow.up" : "arrow.down")
            .foregroundColor(value ? .green : .red)
    }
    
    /// show price changing in percent
    func showPriceChangesInPercent(for periodTitle: String, and value: Double) -> some View {
        VStack {
            Text(periodTitle)
            Text(Double.formatNumber(value) + "%")
                .foregroundColor(value >= 0 ? .green : .red)
        }
    }
    
    func setUpTabBar() {
        let appearance = UITabBarAppearance()
        let itemAppearance = UITabBarItemAppearance()
        
        // disable transparent toolbar in ios 15.0+
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        itemAppearance.selected.iconColor = .white
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
        itemAppearance.normal.iconColor = UIColor.darkGray
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.darkGray
        ]
        appearance.stackedLayoutAppearance = itemAppearance
        appearance.inlineLayoutAppearance = itemAppearance
        appearance.compactInlineLayoutAppearance = itemAppearance
        appearance.backgroundColor = .systemMint.withAlphaComponent(0.7)
        
        UITabBar.appearance().standardAppearance = appearance
    }
    
    func setUpNavigationBar() {
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = .systemMint.withAlphaComponent(0.7)
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.darkGray]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]

        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        
        UINavigationBar.appearance().tintColor = .white
    }
}
