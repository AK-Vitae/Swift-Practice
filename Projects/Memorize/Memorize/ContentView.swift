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
    var body: some View {
        HStack{
            ForEach(0..<4){ index in
                CardView(isFaceUp: true)
            }
            // return ForEach(0..<4, content: { index in
            // ZStack(content: {
            // RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
            // RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
            // Text("👻")
            // })
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack() {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
