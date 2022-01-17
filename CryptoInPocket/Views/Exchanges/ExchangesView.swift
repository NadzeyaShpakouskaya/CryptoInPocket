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
        List(viewModel.exchanges, id: \.exchangeID) { exchangeDetailsVM in
            ExchangeRow(viewModel: exchangeDetailsVM)
        }
        .navigationTitle(viewModel.header)
        .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
        .refreshable {
            await viewModel.fetchExchanges()
        }
        .task {
            await viewModel.fetchExchanges()
        }
    }
}


struct ExchangeRow: View {
    let viewModel: DetailedExchangeViewModel
    
    var body: some View {
        NavigationLink(destination: DetailedExchangeView(detailedViewModel: viewModel)) {
            Text(viewModel.exchangeName)
        }
    }
}

struct ExchangesView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangesView(viewModel: ExchangesViewModel())
    }
}
