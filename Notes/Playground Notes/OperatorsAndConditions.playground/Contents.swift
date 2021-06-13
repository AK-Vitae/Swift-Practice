import UIKit

// Arithmetic Operators
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore
let product = firstScore * secondScore
let divided = firstScore / secondScore
let remainder = 13 % secondScore

// Operator Overloading: what an operator does depends on the values you use it with
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

// Compound operators
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// Comparison Operators
firstScore == secondScore
firstScore != secondScore

firstScore < secondScore
firstScore >= secondScore

// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

// Combining operators
let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}

// Ternary operator: condition/comparison ? true case : false case
let cardOne = 11
let cardTwo = 10
print(cardOne == cardTwo ? "Cards are the same" : "Cards are different")

// Switch statements
let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
    fallthrough // Allows execution to continue
default:
    print("Enjoy your day!")
}

// Range Operator: The half-open range operator, ..<, creates ranges up to but excluding the final value, and the closed range operator, ..., creates ranges up to and including the final value.
let finalScore = 85

switch finalScore {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
