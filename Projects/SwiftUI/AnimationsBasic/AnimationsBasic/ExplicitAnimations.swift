//
//  ExplicitAnimations.swift
//  AnimationsBasic
//
//  Created by Akshith Ramadugu on 12/15/23.
//

import SwiftUI

struct ExplicitAnimations: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 1, y: 1, z: 1)
        )
    }
}

#Preview {
    ExplicitAnimations()
}
