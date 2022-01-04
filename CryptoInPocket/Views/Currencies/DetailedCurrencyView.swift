//
//  DetailedCurrencyView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct DetailedCurrencyView: View {
    @ObservedObject var detailedViewModel: DetailedCurrencyViewModel
    
    var body: some View {
        VStack{
            VStack(spacing: 16){
                generalInfoView
                currencyValueChangesView
                
            }.padding()
                .frame(height: 150)
                .background(Color(UIColor.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Spacer()
            MarketsForCurrencySectionView(id: detailedViewModel.currencyId)
        }.navigationTitle(detailedViewModel.currencyName)
            .padding()
    }
}

extension DetailedCurrencyView {
    private var generalInfoView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(detailedViewModel.priceInfo)
                Text(detailedViewModel.tradingVolumeInfo)
            }
            Spacer()
            VStack {
                Text(detailedViewModel.currencyId)
                    .bold()
                    .font(.title)
                FavoriteButtonView(
                    color: .orange,
                    isFavorite: detailedViewModel.isFavorite,
                    action: detailedViewModel.favoriteButtonPressed
                )
                
            }.foregroundColor(.orange)
        }
    }
    
    private var currencyValueChangesView: some View{
        HStack{
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
}

struct PercentageChangesView: View {
    let title: String
    let value: String
    let isIncreased: Bool
    
    var body: some View {
        VStack {
            Text(title)
            Text(value)
                .foregroundColor(isIncreased ? .green : .red)
        }
    }
}

struct PercentageChangesHorizontalView: View {
    let title: String
    let value: String
    let isIncreased: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Text(value)
                .foregroundColor(isIncreased ? .green : .red)
        }
    }
}

struct DetailedCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCurrencyView(
            detailedViewModel: DetailedCurrencyViewModel(Currency.getTestCurrency())
        )
    }
}
