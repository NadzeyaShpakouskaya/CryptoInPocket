//
//  CurrenciesView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct CurrenciesView: View {
    @StateObject private var viewModel: CurrenciesViewModel = CurrenciesViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.currencies, id: \.currencyId) { currencyDetailsVM in
                NavigationLink(destination: DetailedCurrencyView(detailedViewModel: currencyDetailsVM)) {
                    HStack{
                        Text(currencyDetailsVM.currencyId)
                    }
                }
            }
            .navigationTitle(viewModel.header)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            .task {
                await viewModel.fetchCurrencies()
            }
        }
    }
}

struct CurrenciesView_Previews: PreviewProvider {
    static var previews: some View {
        CurrenciesView().environmentObject(CurrenciesViewModel())
    }
}
