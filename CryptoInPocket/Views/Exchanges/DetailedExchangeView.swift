//
//  DetailedExchangeView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct DetailedExchangeView: View {
    @ObservedObject var detailedViewModel: DetailedExchangeViewModel
    
    var body: some View {
        VStack{
            generalInfo
            MarketsForExchangeSectionView(id: detailedViewModel.exchangeID)
        }.padding()
            .navigationTitle(detailedViewModel.exchangeName)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - SubViews

extension DetailedExchangeView {
    
    private var generalInfo: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "v.circle.fill")
                Text(detailedViewModel.tradingLabelText)
                Spacer()
                Text(detailedViewModel.valueTradingText)
            }
            HStack {
                Image(systemName: "network")
                Link(
                    detailedViewModel.titleForSiteLink,
                    destination: detailedViewModel.urlForSiteLink
                )
                Spacer()
                FavoriteButtonView(
                    color: .indigo,
                    isFavorite: detailedViewModel.isFavorite,
                    action: detailedViewModel.favoriteButtonPressed
                )
            }
        }.padding()
            .foregroundColor(.indigo)
            .background(Color(uiColor: .systemGray3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct DetailedExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedExchangeView(
            detailedViewModel: DetailedExchangeViewModel(exchange: Exchange.getTestExchange()))
    }
}
