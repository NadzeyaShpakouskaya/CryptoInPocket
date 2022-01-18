//
//  ExchangesView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct ExchangesView: View {
    @ObservedObject var viewModel: ExchangesViewModel
    
    var body: some View {
        Group {
            if viewModel.exchanges.isEmpty {
                LoadingView()
                    .task { await viewModel.fetchExchanges() }
            } else {
                List(viewModel.exchanges, id: \.exchangeID) { exchangeDetailsVM in
                    ExchangeRow(viewModel: exchangeDetailsVM)
                }
            }
        }
        .navigationTitle(viewModel.header)
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
    }
}

struct ExchangesView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangesView(viewModel: ExchangesViewModel())
    }
}
