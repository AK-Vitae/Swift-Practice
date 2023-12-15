//
//  ContentView.swift
//  AnimationsBasic
//
//  Created by Akshith Ramadugu on 12/15/23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("Tap Me") {
            // animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
        /// Simple ease in animation
//        .animation(.easeInOut(duration: 2), value: animationAmount)
        /// Button will scale up quickly and bounce
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        /// Button will now wait for a second before executing a two-second animation
//        .animation(
//            .easeIn(duration: 2)
//            .delay(1),
//            value: animationAmount
//        )
        /// This creates a one-second animation that will bounce up and down before reaching its final size
//        .animation(
//            .easeIn(duration: 1)
//            .repeatCount(2, autoreverses: true),
//            value: animationAmount
//        )
        /// Continuous animation
//        .animation(
//            .easeInOut(duration: 1)
//            .repeatForever(), value: animationAmount
//        )
    }
}

#Preview {
    ContentView()
}
