//
//  ExchangesViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import Foundation

@MainActor class ExchangesViewModel: ObservableObject {
    @Published var exchanges: [DetailedExchangeViewModel] = []
    
    let header = "Exchanges"
    
    func fetchExchanges() async {
        exchanges = []
        do {
            let exchangesData = try await NetworkManagerAsync.shared.fetchExchanges()
            exchangesData.forEach { exchange in
                let exchangeVM = DetailedExchangeViewModel(exchange: exchange)
                exchanges.append(exchangeVM)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
}
