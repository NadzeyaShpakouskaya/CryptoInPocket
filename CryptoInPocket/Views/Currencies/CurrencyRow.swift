//
//  CurrencyRow.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/01/2022.
//

import SwiftUI

struct CurrencyRow: View {
    let currencyDetailsVM: DetailedCurrencyViewModel
    
    var body: some View {
        NavigationLink(destination: DetailedCurrencyView(detailedViewModel: currencyDetailsVM)) {
            HStack(spacing: 16) {
                showArrowUpDown(for: currencyDetailsVM.isLastDayValueIncreased)
                Text(currencyDetailsVM.currencyId)
                Spacer()
                Text(currencyDetailsVM.price)
            }
        }
    }
}

struct CurrencyRow_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyRow(currencyDetailsVM: DetailedCurrencyViewModel(Currency.getTestCurrency()))
    }
}
