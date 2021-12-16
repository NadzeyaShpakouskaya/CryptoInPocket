//
//  DetailedExchangeView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 16/12/2021.
//

import SwiftUI

struct DetailedExchangeView: View {
    @ObservedObject var detailedViewModel: DetailedExchangeViewModel
    
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {

            VStack(spacing: 16){
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
                    Spacer()
//                TODO: - Implement "Add to Favorite" button
                }
            }.padding()
                .foregroundColor(textColor)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .navigationTitle(detailedViewModel.exchangeName)
                .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
    }
}

    // MARK: - SubViews

extension DetailedExchangeView {
    
}

struct DetailedExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedExchangeView(
            detailedViewModel: DetailedExchangeViewModel(exchange: Exchange.getTestExchange()),
            textColor: .indigo,
            backgroundColor: .gray)
    }
}