//
//  FavoritesView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    
    @State private var showCurrencyPopover: Bool = false
    @State private var showExchangePopover: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    exchangeSection
                    currenciesSection
                }
                
                if showCurrencyPopover {
                    if let selected = viewModel.selectedCurrency {
                        FavoritePopUpCurrencyView(detailedViewModel: selected, showPopUp: $showCurrencyPopover)
                    }
                }
                
                if showExchangePopover {
                    if let selected = viewModel.selectedExchange {
                        FavoritePopUpExchangeView(detailedViewModel: selected, showPopUp: $showExchangePopover)
                    }
                }
            }
            .navigationTitle(viewModel.mainHeader)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            .onAppear { viewModel.loadFavoritesInfo() }
        }
    }
}

// MARK: - Subviews
extension FavoritesView {
    private var exchangeSection: some View {
        Section(header: Text(viewModel.exchangesSectionHeader)) {
            ForEach(viewModel.favoriteExchangesNames, id: \.self) { title in
                FavoriteRowView(title: title, color: .indigo)
                    .onTapGesture {
                        Task {
                            await viewModel.fetchExchangeWith(id: title)
                        }
                        showExchangePopover.toggle()
                    }
            }.onDelete { offsetIndex in
                viewModel.deleteExchangeFromFavorites(offsetIndex)
            }
        }
    }
    
    private var currenciesSection: some View {
        Section(header: Text(viewModel.currenciesSectionHeader)) {
            ForEach(viewModel.favoriteCurrenciesNames, id: \.self) { title in
                FavoriteRowView(title: title, color: .orange)
                    .onTapGesture {
                        Task {
                            await viewModel.fetchCurrencyWith(id: title)
                        }
                        showCurrencyPopover.toggle()
                    }
            }.onDelete { offsetIndex in
                viewModel.deleteCurrencyFromFavorites(offsetIndex)
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: FavoritesViewModel())
    }
}
