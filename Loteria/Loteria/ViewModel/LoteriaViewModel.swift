//
//  LoteriaViewModel.swift
//  Loteria
//
//  Created by Roberto Filho on 24/02/23.
//

import Foundation
import SwiftUI
import Combine

class LoteriaViewModel: ObservableObject {
    @Published var gametype = GameType.lotery
    @Published var action: Int = 0
    @Published var megaSena: [Int] = []
    
    init() {
        
    }
    
    func generateGame() -> Array<Any>{
        var limit: Int = 0
        var maximiumNumber: Int = 0
        if gametype.rawValue == "Mega-Sena" {
            limit = 6
            maximiumNumber = 60
        }
        else {
            limit = 5
            maximiumNumber = 80
        }
        self.action = 1
        while megaSena.count < limit {
            let number = Int(arc4random_uniform(UInt32(maximiumNumber)) + 1)
            if !megaSena.contains(number) {
                megaSena.append(number)
            }
        }
        megaSena = megaSena.sorted()
        return megaSena.sorted()
    }
    
}
