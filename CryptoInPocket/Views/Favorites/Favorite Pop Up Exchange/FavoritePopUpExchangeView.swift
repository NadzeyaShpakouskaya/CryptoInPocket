//
//  FavoritePopUpExchangeView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 03/01/2022.
//

import SwiftUI

struct FavoritePopUpExchangeView: View {
    @ObservedObject var detailedViewModel: FavoritePopUpExchangeViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
            VStack(spacing: 16) {
                generalInfo
                markets
            }.padding()
                .background(Color.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .task { await detailedViewModel.fetchFavoriteMarketsForExchange() }
        }.padding()
    }
}

extension FavoritePopUpExchangeView {
    private var generalInfo: some View {
        VStack {
            HStack {
                Spacer()
                Text(detailedViewModel.exchangeName)
                    .fontWeight(.heavy)
                    .font(.title)
                Spacer()
                CloseViewButton(color: .white, action: { showPopUp.toggle() })
            }
            VStack(alignment: .leading, spacing: 16) {
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
                }
            }
        }.foregroundColor(.white)
    }
    
    private var markets: some View {
        VStack {
        Text(detailedViewModel.titleForCurrencies)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .font(.title3)
        List(detailedViewModel.favoriteCurrencies, id: \.id) { item in
            MarketForExchangeDetailedView(detailedViewModel: item)
        }.listStyle(.plain)
                .border(.gray.opacity(0.3), width: 2)
            .background(.clear)
        }
    }
}

struct FavoritePopUpExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePopUpExchangeView(
            detailedViewModel: FavoritePopUpExchangeViewModel(exchange: Exchange.getTestExchange()),
            showPopUp: .constant(false)
        )
    }
}
