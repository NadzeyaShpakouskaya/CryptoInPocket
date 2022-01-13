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
        ZStack{
            Color(UIColor.systemGray5)
        
        
            VStack(spacing: 16) {
            HStack{
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
                Button(action: { showPopUp.toggle()}) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                    
                }
            }.foregroundColor(.orange)
            HStack {
                Text(detailedViewModel.priceInfo)
                Spacer()
                Text(detailedViewModel.tradingVolumeInfo)
                
            }
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
            
        }.padding()
        
        
      
     
    }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 12))
}
}

struct SmallPopUpCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        SmallPopUpCurrencyView(detailedViewModel: DetailedCurrencyViewModel(Currency.getTestCurrency()), showPopUp: .constant(true))
    }
}
