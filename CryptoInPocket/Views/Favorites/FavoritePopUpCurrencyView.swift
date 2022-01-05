//
//  FavoritePopUpCurrencyView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 03/01/2022.
//

import SwiftUI

struct FavoritePopUpCurrencyView: View {
    @ObservedObject var detailedViewModel: DetailedCurrencyViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack{
            Color(UIColor.systemGray6).frame(height: UIScreen.main.bounds.height)
            VStack{
                VStack{
                    generalInfo
                    Spacer()
                    priceChangesView
                }
                .padding()
                .frame(height: 200)
                .background(Color.orange.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
                
            }
            .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
        }.padding(.horizontal)
        
    }
}

extension FavoritePopUpCurrencyView {
    private var generalInfo: some View {
        VStack{
            HStack{
                Spacer()
                Text(detailedViewModel.currencyDetailed)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                Spacer()
                Button(action: { showPopUp.toggle()}) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Text(detailedViewModel.priceInfo)
                .font(.title3)
                .fontWeight(.heavy)
            Text(detailedViewModel.tradingVolumeInfo)
        }
    }
    
    private var priceChangesView: some View {
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
    }
}
struct FavoritePopUpCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePopUpCurrencyView(detailedViewModel: DetailedCurrencyViewModel(Currency.getTestCurrency()), showPopUp: .constant(false))
    }
}
