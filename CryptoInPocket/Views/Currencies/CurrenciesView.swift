//
//  CurrenciesView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct CurrenciesView: View {
    @ObservedObject var viewModel: CurrenciesViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.loadedCurrencies, id: \.currencyId) { currencyDetailsVM in
                if currencyDetailsVM == viewModel.lastFetched {
                    CurrencyRow(currencyDetailsVM: currencyDetailsVM)
                        .task { await viewModel.loadMoreCurrencies() }
                    LoadingView()
                } else {
                    CurrencyRow(currencyDetailsVM: currencyDetailsVM)
                }
            }
            .navigationTitle(viewModel.header)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            .task {
                await viewModel.loadMoreCurrencies()
            }
        }
    }
    
}

struct CurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView(viewModel: CurrenciesViewModel())
    }
}
