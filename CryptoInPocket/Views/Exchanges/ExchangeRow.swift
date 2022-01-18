//
//  ExchangeRow.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/01/2022.
//

import SwiftUI

struct ExchangeRow: View {
    let viewModel: DetailedExchangeViewModel
    
    var body: some View {
        NavigationLink(destination: DetailedExchangeView(detailedViewModel: viewModel)) {
            Text(viewModel.exchangeName)
        }
    }
}

struct ExchangeRow_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeRow(viewModel: DetailedExchangeViewModel(exchange: Exchange.getTestExchange()))
    }
}
