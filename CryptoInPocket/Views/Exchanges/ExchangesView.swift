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
        NavigationView {
            List(viewModel.exchanges, id: \.exchangeID) { exchangeDetailsVM in
                NavigationLink(destination:DetailedExchangeView(
                    detailedViewModel: exchangeDetailsVM,
                    textColor: .indigo,
                    backgroundColor: Color(UIColor.systemGray6)
                ).padding()) {
                    Text(exchangeDetailsVM.exchangeName)
                }
            }
            .navigationTitle(viewModel.header)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            .task {
                await viewModel.fetchExchanges()
            }
        }
    }
}

struct ExchangesView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangesView(viewModel: ExchangesViewModel())
//            .environmentObject(ExchangesViewModel())
    }
}
