//
//  MarketsForCurrencySectionView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct MarketsForCurrencySectionView: View {
    @ObservedObject private var viewModel: MarketsForCurrencySectionViewModel = MarketsForCurrencySectionViewModel()
    
    let id: String
    
    var body: some View {
        VStack {
            SectionHeaderView(color: .orange) { viewModel.hideMarketsButtonPressed()
            }
            Spacer()
            if !viewModel.isMarketsSectionHidden {
                List(viewModel.markets, id: \.id) { detailedVM in
                    MarketForCurrencyDetailedView(detailedVM: detailedVM)
                }.listStyle(.plain)
            }
        }.task {
            await viewModel.fetchMarketsForCurrency(with: id)
        }
    }
    
}

struct MarketForCurrencySectionView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsForCurrencySectionView(id: "BTC")
            .environmentObject(MarketsForCurrencySectionViewModel())
    }
}
