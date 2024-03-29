//
//  AnimatingBindings.swift
//  AnimationsBasic
//
//  Created by Akshith Ramadugu on 12/15/23.
//

import SwiftUI

struct AnimatingBindings: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
         return VStack {
             Stepper("Scale Amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
             ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    AnimatingBindings()
}
