//
//  LaunchViewModel.swift
//  Loteria
//
//  Created by Roberto Filho on 24/02/23.
//

import Foundation
import SwiftUI
import Combine

class LaunchViewModel: ObservableObject {
    
    @Published var uiState: LaunchUiState = .loading
    
    init() {
        
    }
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .goToLoteria
        }
    }
}

extension LaunchViewModel {
    func loteriaView() -> some View {
        return LauchViewRouter.makeLoteriaView()
    }
}
