//
//  LaunchViewRouter.swift
//  Loteria
//
//  Created by Roberto Filho on 24/02/23.
//

import SwiftUI

enum LauchViewRouter {
    static func makeLoteriaView() -> some View {
        return LoteriaView(viewModel: LoteriaViewModel())
    }
}
