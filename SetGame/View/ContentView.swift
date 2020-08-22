//
//  ContentView.swift
//  SetGame
//
//  Created by Hugo Santiago on 22/08/20.
//  Copyright © 2020 Hugo Santiago. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var table: setGameVM = setGameVM()
    var body: some View {
        Grid(table.cards.chunked(into: 6)[0]) { card in
            CardView(color: card.color, figure: card.shape, number: card.number, shading: card.shading)
        }
    }
}

struct CardView : View {
    var color: Color
    var figure: String
    var number:Int
    var shading:Double
    
    var body: some View {
        ZStack {
            RoundedRectangle( cornerRadius: 10, style: .continuous)
                .stroke(Color.black)
                .shadow(radius: 10)
                .padding()
            VStack {
                ForEach (1..<number+1) {_ in
                    
                    if self.figure == "Circle" {
                        Circle()
                            .stroke(self.color)
                            .opacity(self.shading)
                            .padding()
                    }
                    if self.figure == "Capsule" {
                        Capsule()
                            .stroke(self.color, lineWidth: 2)
                            .opacity(self.shading)
                            .padding()
                    }
                    if self.figure == "Rectangle" {
                        Rectangle()
                            .stroke(self.color, lineWidth: 2)
                            .opacity(self.shading)
                            .padding()
                    }
                }
            }
            .padding()
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
