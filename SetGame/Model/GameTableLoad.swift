//
//  GameTableLoad.swift
//  SetGame
//
//  Created by Hugo Santiago on 25/08/20.
//  Copyright © 2020 Hugo Santiago. All rights reserved.
//

import Foundation
import SwiftUI

struct CargarInfo {
    
    func load () -> Array<BoardSet.Card>{
        var cards = Array<BoardSet.Card>()
        let shapes = ["Capsule", "Circle", "Rectangle"]
        let colors: [Color] = [.red, .green, .purple]
        let opacities = [1.0, 0.0 , 0.4]
        let numbers:[Int] = [1,2,3]
            
        for sp in 0..<shapes.count {
            for cl in 0..<colors.count {
                for op in 0..<opacities.count {
                    for nm in 0..<numbers.count {
                        cards.append(BoardSet.Card(number: numbers[nm], shape: shapes[sp], shading: opacities[op], color: colors[cl], isUp: false))
                    }
                }
            }
        }
        cards.shuffle()
        return cards
    }
}
