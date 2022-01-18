//
//  LoadingView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 18/01/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        HStack{
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
