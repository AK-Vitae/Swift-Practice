//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Akshith Ramadugu on 12/4/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionNumber = 0
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                Spacer()
                titleText
                flagButtons
                Spacer()
                Spacer()
                scoreText
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over. Your Score \(score)/8", isPresented: $gameOver) {
            Button("Continue", role: .destructive, action: resetGame)
        }
    }
}

// MARK: - ContentView Extensions
extension ContentView {
    private var backgroundGradient: some View {
        RadialGradient(stops: [
            .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
            .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
        ], center: .top, startRadius: 200, endRadius: 700)
        .ignoresSafeArea()
    }
    
    private var titleText: some View {
        Text("Guess the Flag")
            .font(.largeTitle.weight(.bold))
            .foregroundStyle(.white)
    }
    
    private var scoreText: some View {
        Text("Score: \(score)")
            .foregroundStyle(.white)
            .font(.title.bold())
    }
    
    private var flagButtons: some View {
        VStack(spacing: 15) {
            VStack {
                Text("Tap the flag of")
                    .foregroundStyle(.secondary)
                    .font(.subheadline.weight(.heavy))
                
                Text(countries[correctAnswer])
                    .font(.largeTitle.weight(.semibold))
            }
            
            ForEach(0..<3) { number in
                Button {
                    flagTapped(number)
                } label: {
                    Image(countries[number])
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong. That is the flag of \(countries[number])"
            if score > 0 {
                score -= 1
            }
        }
        
        if questionNumber == 7 {
            gameOver = true
        } else {
            questionNumber += 1
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        questionNumber = 0
    }
}

#Preview {
    ContentView()
}
