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
        ZStack{
            Color(UIColor.systemGray6)
            VStack{
                VStack(spacing: 16){
                    
                    HStack{
                        Spacer()
                        Text(detailedViewModel.exchangeName)
                            .fontWeight(.heavy)
                            .font(.title)
                        Spacer()
                        Button(action: { showPopUp.toggle()}) {
                            Image(systemName: "xmark")
                        }
                    }
                    VStack(alignment: .leading, spacing: 16) {
                        HStack{
                            Image(systemName: "v.circle.fill")
                            Text(detailedViewModel.tradingLabelText)
                            Spacer()
                            Text(detailedViewModel.valueTradingText)
                        }
                        HStack{
                            Image(systemName: "network")
                            Link(
                                detailedViewModel.titleForSiteLink,
                                destination:detailedViewModel.urlForSiteLink
                            )
                        }
                    }
                    
                    Text(detailedViewModel.titleForCurrencies)
                        .fontWeight(.heavy)
                        .font(.title3)
                    VStack{
                        ScrollView{
                            ForEach(detailedViewModel.favoriteCurrencies, id: \.id) { item in
                                MarketForExchangeDetailedView(detailedViewModel: item)
                                    .padding(8)
                            }
                            
                        }
                    }
                }
                .padding()
                .background(.indigo)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            .task {
                await  detailedViewModel.fetchFavoriteMarketsForExchange()
            }
        }.padding(.horizontal)
        
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
