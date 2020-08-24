//
//  ContentView.swift
//  SetGame
//
//  Created by Hugo Santiago on 22/08/20.
//  Copyright © 2020 Hugo Santiago. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var table: setGameVM = setGameVM()
    var body: some View {
        VStack {
            Button(action: {
                print(String(self.table.cards.takeNElements(n: 12).count))
            }) {
                Text("New Game")
            }
            Grid(table.cards.takeNElements(n: 12)) { card in
                CardView(color: card.color, figure: card.shape, number: card.number, shading: card.shading, isUp: false)
                    .onTapGesture {
                        self.table.selectCard(card: card)
                }
            }
        }
        .padding()
        
    }
}

struct CardView : View {
    var color: Color
    var figure: String
    var number:Int
    var shading:Double
    var isUp:Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle( cornerRadius: 10, style: .continuous)
                .stroke(Color.gray)
                .padding(5)
            if isUp {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.yellow)
                    .padding(5)
            }
            
            VStack {
                ForEach (1..<number+1) {_ in
                    if self.figure == "Circle" {
                        if self.shading > 0 {
                            Circle()
                                .fill(self.color)
                                .opacity(self.shading)
                                .frame(width: 35, height: 35)
                        } else {
                            Circle()
                                .stroke(self.color)
                                .frame(width: 35, height: 35)
                        }
                    }
                    if self.figure == "Capsule" {
                        if self.shading > 0 {
                            Capsule()
                                .fill(self.color)
                                .opacity(self.shading)
                                .frame(width: 35, height: 50)
                                .rotationEffect(Angle.degrees(90))
                        } else {
                            Capsule()
                                .stroke(self.color)
                                .frame(width: 35, height: 50)
                                .rotationEffect(Angle.degrees(90))
                        }
                    }
                    if self.figure == "Rectangle" {
                        if self.shading > 0 {
                            Rectangle()
                                .fill(self.color)
                                .opacity(self.shading)
                                .frame(width: 35, height: 35)
                        } else {
                            Rectangle()
                                .stroke(self.color, lineWidth: 2)
                                .frame(width: 35, height: 35)
                        }
                    }
                }
            }
            .padding(4)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
