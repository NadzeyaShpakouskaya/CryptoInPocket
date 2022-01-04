//
//  FavoritePopUpExchangeView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 03/01/2022.
//

import SwiftUI

struct FavoritePopUpExchangeView: View {
    @ObservedObject var detailedViewModel: DetailedExchangeViewModel
    @Binding var showPopUp: Bool
    
    var body: some View {
        ZStack{
            Color(UIColor.systemGray6).frame(height: UIScreen.main.bounds.height)
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
                
                HStack{
                    Button( action: {}) {
                        Text("Markets: see details")
                    }
                    .cornerRadius(5)
                }
            }.padding()
                .background(.indigo)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }.padding(.horizontal)
        
    }
}

struct FavoritePopUpExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePopUpExchangeView(
            detailedViewModel: DetailedExchangeViewModel(exchange: Exchange.getTestExchange()),
            showPopUp: .constant(false)
        )
    }
}
