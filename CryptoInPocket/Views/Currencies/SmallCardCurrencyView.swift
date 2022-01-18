//
//  SmallCardCurrencyView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 18/01/2022.
//

import SwiftUI

struct SmallCardCurrencyView: View {

    @ObservedObject var viewModel: DetailedCurrencyViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            generalInfoView
            currencyValueChangesView
        }.padding()
            .frame(height: 150)
            .background(Color(UIColor.orange.withAlphaComponent(0.25)))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

extension SmallCardCurrencyView {
    
    private var generalInfoView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.priceInfo).bold()
                Text(viewModel.tradingVolumeInfo)
            }
            Spacer()
            VStack {
                Text(viewModel.currencyId)
                    .bold()
                    .font(.title)
                FavoriteButtonView(
                    color: .orange,
                    isFavorite: viewModel.isFavorite,
                    action: viewModel.favoriteButtonPressed
                )
                
            }.foregroundColor(.orange)
        }
    }
    
    private var currencyValueChangesView: some View {
        HStack {
            PercentageChangesView(
                title: viewModel.lastHourChangesTitle,
                value: viewModel.lastHourChangesValue,
                isIncreased: viewModel.isLastHourValueIncreased
            )
            Spacer()
            PercentageChangesView(
                title: viewModel.lastDayChangesTitle,
                value: viewModel.lastDayChangesValue,
                isIncreased: viewModel.isLastDayValueIncreased
            )
            Spacer()
            PercentageChangesView(
                title: viewModel.lastWeekChangesTitle,
                value: viewModel.lastWeekChangesValue,
                isIncreased: viewModel.isLastWeekValueIncreased)
        }
    }
}

struct SmallCardCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        SmallCardCurrencyView(viewModel: DetailedCurrencyViewModel(Currency.getTestCurrency()))
    }
}
