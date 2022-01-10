//
//  Searching.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 10/01/2022.
//

import SwiftUI

struct Searching: View {
    @StateObject var viewModel: SearchingViewModel = SearchingViewModel()
    @State private var searchText = ""
    @State private var showDetailed = false
    
    var body: some View {
        NavigationView {
            ZStack{
                List {
                    ForEach(searchResults, id: \.id) { item in
                        NavigationLink(destination:
                                        DetailedCurrencyView(detailedViewModel: viewModel.selectedCurrency ?? DetailedCurrencyViewModel(Currency.getTestCurrency()))){
                            FavoriteRowView(title: item.info, color: .gray)
                        }
                        .onTapGesture {
                            Task {
                                await viewModel.fetchCurrencyWith(id: item.id)
                            }
                            showDetailed.toggle()
                        }
                        
                        
                    }
                }
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                )
            }
            .navigationTitle("Searching")
            .task {
                await viewModel.fetchData()
            }
            .sheet(isPresented: $showDetailed) {
                if let selected = viewModel.selectedCurrency {
                    DetailedCurrencyView(detailedViewModel:selected)
                }
            }
        }
    }
    
    var searchResults: [AssetViewModel] {
        if searchText.isEmpty {
            return viewModel.currencies
        } else {
            return viewModel.currencies.filter {
                $0.info.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    
    
}

struct Searching_Previews: PreviewProvider {
    static var previews: some View {
        Searching()
    }
}
