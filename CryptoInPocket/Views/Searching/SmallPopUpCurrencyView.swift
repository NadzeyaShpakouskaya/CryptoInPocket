//
//  SmallPopUpCurrencyView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 11/01/2022.
//

import SwiftUI

struct SmallPopUpCurrencyView: View {
    
    @ObservedObject var detailedViewModel: DetailedCurrencyViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray5)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(spacing: 16) {
                basicInfo
                priceChangingInfo
                currencyFurtherInfo
                Spacer()
                
            }.padding()
        }.padding()
       
    }
}

extension SmallPopUpCurrencyView {
    private var basicInfo: some View {
        VStack(spacing: 16) {
            HStack {
                FavoriteButtonView(
                    color: .orange,
                    isFavorite: detailedViewModel.isFavorite,
                    action: detailedViewModel.favoriteButtonPressed
                )
                Spacer()
                Text(detailedViewModel.currencyDetailed)
                    .bold()
                    .font(.title)
                Spacer()
                CloseViewButton(color: .gray) { showPopUp.toggle() }
            }.foregroundColor(.orange)
            
            HStack {
                Text(detailedViewModel.priceInfo)
                Spacer()
                Text(detailedViewModel.tradingVolumeInfo)
                
            }
        }
    }
    
    private var priceChangingInfo: some View {
        HStack {
            PercentageChangesView(
                title: detailedViewModel.lastHourChangesTitle,
                value: detailedViewModel.lastHourChangesValue,
                isIncreased: detailedViewModel.isLastHourValueIncreased
            )
            Spacer()
            PercentageChangesView(
                title: detailedViewModel.lastDayChangesTitle,
                value: detailedViewModel.lastDayChangesValue,
                isIncreased: detailedViewModel.isLastDayValueIncreased
            )
            Spacer()
            PercentageChangesView(
                title: detailedViewModel.lastWeekChangesTitle,
                value: detailedViewModel.lastWeekChangesValue,
                isIncreased: detailedViewModel.isLastWeekValueIncreased)
        }
    }
    
    private var currencyFurtherInfo: some View {
        HStack {
            Text(detailedViewModel.description)
                .multilineTextAlignment(.leading)
        }
    }
}

struct SmallPopUpCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPopUpCurrencyView(
            detailedViewModel: DetailedCurrencyViewModel(Currency.getTestCurrency()),
            showPopUp: .constant(true)
        )
    }
}
