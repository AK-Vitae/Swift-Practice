//
//  AnimationStack.swift
//  AnimationsBasic
//
//  Created by Akshith Ramadugu on 12/15/23.
//

import SwiftUI

struct AnimationStack: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        // Animations for the background
//        .animation(.default, value: enabled)
        /// Color change will happen instantly
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        // Animation for the clipShape
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    AnimationStack()
}
