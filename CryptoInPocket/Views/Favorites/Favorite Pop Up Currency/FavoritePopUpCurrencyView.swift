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
        ZStack{
            Color(UIColor.systemGray6)
            VStack{
                VStack(spacing: 16){
                    generalInfo
                    priceChangesView.frame(alignment: .leading)
                    markets
                }
                
                .padding()
                
                .background(Color.orange.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Spacer()
                
            }
            .task {
                await detailedViewModel.fetchFavoriteMarkets()
            }
        }.padding(.horizontal)
        
    }
}

extension FavoritePopUpCurrencyView {
    private var generalInfo: some View {
        VStack(spacing: 8){
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
            HStack{
            Text(detailedViewModel.priceInfo)
                .font(.title3)
                .fontWeight(.heavy)
                Spacer()
                Text(detailedViewModel.tradingVolumeInfo)
                
            }
        }
    }
    
    private var priceChangesView: some View {
        HStack{
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
        VStack{
            Text(detailedViewModel.titleForExchanges)
                .fontWeight(.heavy)
                .font(.title3)
                .foregroundColor(.orange)
            VStack{
                ScrollView{
                    ForEach(detailedViewModel.favoriteVMExchanges, id: \.id) { item in
                        MarketForCurrencyDetailedView(detailedVM: item)
                            .padding(8)
                    }
                    
                }
            }
            
        }
    }
}
struct FavoritePopUpCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePopUpCurrencyView(detailedViewModel: FavoritePopUpCurrencyViewModel(Currency.getTestCurrency()), showPopUp: .constant(false))
    }
}
