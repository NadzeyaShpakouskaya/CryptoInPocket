//
//  FavoritePopUpCurrencyView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 03/01/2022.
//

import SwiftUI

struct FavoritePopUpCurrencyView: View {
    @ObservedObject var detailedViewModel: FavoritePopUpCurrencyViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray6)
            VStack(spacing: 16) {
                generalInfo
                markets
            }.padding()
                .background(Color.orange.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .task { await detailedViewModel.fetchFavoriteMarkets() }
        }.padding()
        
    }
}

extension FavoritePopUpCurrencyView {
    private var generalInfo: some View {
        VStack(spacing: 8) {
            HStack {
                Spacer()
                Text(detailedViewModel.currencyDetailed)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                Spacer()
                CloseViewButton(color: .gray) { showPopUp.toggle() }
            }
            
            HStack {
                Text(detailedViewModel.priceInfo)
                    .font(.title3)
                    .fontWeight(.heavy)
                Spacer()
                Text(detailedViewModel.tradingVolumeInfo)
            }
            priceChangesView
                .frame(alignment: .leading)
        }
    }
    
    private var priceChangesView: some View {
        HStack {
            VStack(alignment: .leading) {
                PercentageChangesHorizontalView(
                    title: detailedViewModel.lastHourChangesTitle,
                    value: detailedViewModel.lastHourChangesValue,
                    isIncreased: detailedViewModel.isLastHourValueIncreased
                )
                
                PercentageChangesHorizontalView(
                    title: detailedViewModel.lastDayChangesTitle,
                    value: detailedViewModel.lastDayChangesValue,
                    isIncreased: detailedViewModel.isLastDayValueIncreased
                )
                
                PercentageChangesHorizontalView(
                    title: detailedViewModel.lastWeekChangesTitle,
                    value: detailedViewModel.lastWeekChangesValue,
                    isIncreased: detailedViewModel.isLastWeekValueIncreased)
            }
            Spacer()
        }
    }
    
    private var markets: some View {
        VStack {
            Text(detailedViewModel.titleForExchanges)
                .fontWeight(.heavy)
                .font(.title3)
                .foregroundColor(.orange)
            
            List(detailedViewModel.favoriteVMExchanges, id: \.id) { item in
                MarketForCurrencyDetailedView(isVolumeDisplaying: false, detailedVM: item)
            }.listStyle(.plain)
                .border(.gray.opacity(0.3), width: 2)
                .background(.clear)
        }
    }
    
}

struct FavoritePopUpCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePopUpCurrencyView(
            detailedViewModel: FavoritePopUpCurrencyViewModel(Currency.getTestCurrency()),
            showPopUp: .constant(false)
        )
    }
}
