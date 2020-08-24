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
        VStack {
            Grid(table.cards.take12()) { card in
                CardView(color: card.color, figure: card.shape, number: card.number, shading: card.shading)
                    .onTapGesture {
                        self.table.selectCard(card: card)
                }
            }
            
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
                .padding(5)
            VStack {
                ForEach (1..<number+1) {_ in
                    if self.figure == "Circle" {
                        if self.shading > 0 {
                            Circle()
                                .fill(self.color)
                                .opacity(self.shading)
                                .padding(4)
                        } else {
                            Circle()
                                .stroke(self.color)
                                .padding(4)
                        }
                    }
                    if self.figure == "Capsule" {
                        if self.shading > 0 {
                            Capsule()
                                .fill(self.color)
                                .opacity(self.shading)
                                .padding(4)
                        } else {
                            Capsule()
                                .stroke(self.color)
                                .padding(4)
                        }
                    }
                    if self.figure == "Rectangle" {
                        if self.shading > 0 {
                            Rectangle()
                                .fill(self.color)
                                .opacity(self.shading)
                                .padding(4)
                        } else {
                            Rectangle()
                                .stroke(self.color, lineWidth: 2)
                                .padding(4)
                        }
                    }
                }
                .frame(width: 35, height: 35)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
