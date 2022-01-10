//
//  SearchingViewModel.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 10/01/2022.
//

import Foundation
import SwiftUI

class SearchingViewModel: ObservableObject {
    @Published var currencies: [AssetViewModel] = []
    @Published var selectedCurrency: DetailedCurrencyViewModel?

    @MainActor
    func fetchData() async {
        currencies = []
        do {
            let assetsData = try await NetworkManagerAsync.shared.fetchAssetsData()
            assetsData.forEach { asset in
                let viewModel = AssetViewModel(data: asset)
                currencies.append(viewModel)
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func fetchCurrencyWith(id: String) async {
        selectedCurrency = nil
        do {
            let currency = try await NetworkManagerAsync.shared.fetchCurrencyBy(id: id)
            selectedCurrency = DetailedCurrencyViewModel(currency)

        } catch {
            print(error.localizedDescription)
        }
    }
    
}
