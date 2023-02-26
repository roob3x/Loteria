//
//  LaunchView.swift
//  Loteria
//
//  Created by Roberto Filho on 24/02/23.
//

import SwiftUI

struct LaunchView: View {
    
    @ObservedObject var viewModel: LaunchViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                LoadingView()
            case .goToLoteria:
                viewModel.loteriaView()
            }
        }
        .onAppear(perform: viewModel.onAppear)
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack{
            Image("launchScreen")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(viewModel: LaunchViewModel())
    }
}
