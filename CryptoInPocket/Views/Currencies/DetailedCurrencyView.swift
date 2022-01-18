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
        VStack {
            SmallCardCurrencyView(viewModel: detailedViewModel)
            Spacer()
            MarketsForCurrencySectionView(id: detailedViewModel.currencyId)
        }.padding()
            .navigationTitle(detailedViewModel.currencyName)
    }
}

struct DetailedCurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCurrencyView(
            detailedViewModel: DetailedCurrencyViewModel(Currency.getTestCurrency())
        )
    }
}
