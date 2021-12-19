//
//  MarketsForExchangeSectionView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct MarketsForExchangeSectionView: View {
    @StateObject private var viewModel: MarketsForExchangeSectionViewModel = MarketsForExchangeSectionViewModel()
    
    let id: String
    
    var body: some View {
        VStack {
           SectionHeaderView(color: .indigo) {
                viewModel.hideMarketsButtonPressed()
            }
            Spacer()
            if !viewModel.isMarketsSectionHidden {
                List(viewModel.marketsForExchange, id: \.id) { detailedVM in
                    MarketForExchangeDetailedView(detailedViewModel: detailedVM)
                }.listStyle(.plain)
            }
        }.task {
            await viewModel.fetchMarketsForExchange(with: id)
        }
    }

}

struct MarketsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsForExchangeSectionView(id: "BINANCE")
            .environmentObject(MarketsForExchangeSectionViewModel())
    }
}
