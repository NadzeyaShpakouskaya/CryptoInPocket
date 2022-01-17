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

            ZStack{
                List {
                    ForEach(searchResults, id: \.id) { item in
                        FavoriteRowView(title: item.info, color: .gray)
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
                if showDetailed {
                    if let selected = viewModel.selectedCurrency {
                    
                            SmallPopUpCurrencyView(detailedViewModel: selected, showPopUp: $showDetailed)
                                .padding()
                                .shadow(color: .gray, radius: 2)
                        
                    }
                }
            }
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            .task {
                await viewModel.fetchData()
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
