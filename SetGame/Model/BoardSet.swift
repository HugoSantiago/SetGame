//
//  SetGame.swift
//  SetGame
//
//  Created by Hugo Santiago on 22/08/20.
//  Copyright © 2020 Hugo Santiago. All rights reserved.
//

import Foundation
import SwiftUI

struct BoardSet {
    
    var cards: Array<Card>
    
    init(){
        let shapes = ["Capsule", "Circle", "Rectangle"]
        let colors: [Color] = [.red, .green, .purple]
        let opacities = [1.0, 0.0 , 0.4]
        let numbers:[Int] = [1,2,3]
        
        cards = Array<Card>()
            
        for sp in 0..<shapes.count {
            for cl in 0..<colors.count {
                for op in 0..<opacities.count {
                    for nm in 0..<numbers.count {
                        cards.append(Card(number: numbers[nm], shape: shapes[sp], shading: opacities[op], color: colors[cl], isUp: false))
                    }
                }
            }
        }
        cards.shuffle()
    }
    
    mutating func selectCard(card: Card) {
        if let chosenCard = cards.firstIndex(matching: card) {
            cards[chosenCard].isUp = !cards[chosenCard].isUp
            print(cards[chosenCard].isUp)
        }
    }
    
    struct Card : Identifiable, Hashable{
        var id = UUID()
        var number : Int
        var shape: String
        var shading : Double
        var color : Color
        var isUp: Bool
        
        init(number: Int, shape:String, shading:Double, color:Color, isUp: Bool) {
            self.number = number
            self.shape = shape
            self.shading = shading
            self.color = color
            self.isUp = isUp
        }
    }
}
