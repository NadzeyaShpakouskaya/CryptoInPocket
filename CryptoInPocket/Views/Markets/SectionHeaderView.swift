//
//  SectionHeaderView.swift
//  CryptoInPocket
//
//  Created by Nadzeya Shpakouskaya on 17/12/2021.
//

import SwiftUI

struct SectionHeaderView: View {
    @ObservedObject var viewModel: SectionHeaderViewModel = SectionHeaderViewModel()

    let color: Color
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(viewModel.headerTitle)
            Spacer()
            Button(viewModel.buttonTitle, action: action)
        }
        .frame(height: 40)
        .foregroundColor(color)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(
            viewModel: SectionHeaderViewModel(),
            color: .orange, action: {}
        )
    }
}
