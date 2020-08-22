//
//  SetGameVM.swift
//  SetGame
//
//  Created by Hugo Santiago on 22/08/20.
//  Copyright © 2020 Hugo Santiago. All rights reserved.
//

import Foundation
import  SwiftUI

struct setGameVM {
    private var board : BoardSet = BoardSet()
    
    //MARK: - Access
    
    var cards: [BoardSet.Card] {
        return board.cards
    }

    //MARK: - Intents
}
