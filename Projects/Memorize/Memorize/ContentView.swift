//
//  ContentView.swift
//  Memorize
//
//  Created on 7/9/20.
//  Copyright © 2020 AK-Vitae. All rights reserved.
//

import SwiftUI

// The type of this variable is any type as long as it behaves like a View
// Text is a view
// Emojis can be added from edit menu
struct ContentView: View {
    var viewModel: EmojiMemoryGame
    var body: some View {
        HStack{
            ForEach(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

// structs are read only by default
struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack() {
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
