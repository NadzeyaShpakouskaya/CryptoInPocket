//
//  CryptoInPocketApp.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 15/12/2021.
//

import SwiftUI

@main
struct CryptoInPocketApp: App {
    let mainVM  = MainViewViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: mainVM)
        }
    }
}
