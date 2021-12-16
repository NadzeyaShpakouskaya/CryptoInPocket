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
            sectionHeaderView
            Spacer()
            if !viewModel.isMarketsHidden {
                List(viewModel.marketsForExchange, id: \.id) { detailedVM in
                    MarketForExchangeDetailedView(detailedViewModel: detailedVM)
                }.listStyle(.plain)
            }
        }.task {
            await viewModel.fetchMarketsForExchange(with: id)
        }
    }
    
    private var sectionHeaderView: some View {
        HStack{
            Text(viewModel.headerTitle)
            
            Spacer()
            Button(viewModel.buttonTitle){
                viewModel.hideMarketsButtonPressed()
            }
        }
        .frame(height: 40)
        .foregroundColor(.indigo)
        
    }
    
}

struct MarketsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MarketsForExchangeSectionView(id: "BINANCE")
            .environmentObject(MarketsForExchangeSectionViewModel())
    }
}
