//
//  FavoritesView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel = FavoritesViewModel()
    
    @State private var showCurrencyPopover: Bool = false
    @State private var showExchangePopover: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                List{
                    Section(header: Text(viewModel.exchangesSectionHeader)) {
                        ForEach(viewModel.favoriteExchangesNames, id: \.self) { title in
                            FavoriteRowView(title: title, color: .indigo)
                                .onTapGesture {
                                    Task{
                                        await viewModel.fetchExchangeWith(id: title)
                                    }
                                    showExchangePopover.toggle()
                                }
                        }.onDelete{ offsetIndex in
                            viewModel.deleteExchangeFromFavorites(offsetIndex)
                        }
                    }
                    
                    Section(header: Text(viewModel.currenciesSectionHeader)) {
                        ForEach(viewModel.favoriteCurrenciesNames, id: \.self) { title in
                            FavoriteRowView(title: title, color: .orange)
                                .onTapGesture {
                                    Task{
                                        await viewModel.fetchCurrencyWith(id: title)
                                    }
                                    showCurrencyPopover.toggle()
                                }
                        }.onDelete{ offsetIndex in
                            viewModel.deleteCurrencyFromFavorites(offsetIndex)
                        }
                    }
                }
                if showCurrencyPopover {
                    if let selected = viewModel.selectedCurrency {
                        FavoritePopUpCurrencyView(detailedViewModel: selected, showPopUp: $showCurrencyPopover)
                            .animation(.easeInOut, value: showCurrencyPopover)
                    }
                }
                
                if showExchangePopover {
                    if let selected = viewModel.selectedExchange {
                        FavoritePopUpExchangeView(detailedViewModel: selected, showPopUp: $showExchangePopover)

                            .animation(.easeInOut, value: showExchangePopover)
                    }
                }
                
            }
            .navigationTitle(viewModel.mainHeader)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
        }.onAppear {
            viewModel.loadFavoritesInfo()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: FavoritesViewModel())
    }
}
