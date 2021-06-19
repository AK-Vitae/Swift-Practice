import UIKit

// Creating Basic Closures
let driving = {
    print("I'm driving in my car")
}

driving()

// Accepting parameters in a closure
// To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting.
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving2("London") // Don't use parameter labels

// Returning values from a closure
// Write return parameter directly before the in keyword
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// Closures as parameters
func travel(action: () -> Void) { // accepts no parameters, and returns Void
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)

// Trailing closure syntax
// If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax.
// Rather than passing in your closure as a parameter, you pass it directly after the function inside braces.
travel() {
    print("I'm driving in my car")
}
// Since there aren't any other paremeters we can eliminate the parantheses
travel {
    print("I'm driving in my car")
}

// Using closures as a parameters when they accept parameters
func travel2(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel2 { (place: String) in
    print("I'm going to \(place) in my car")
}

// Using closures as parameters when they return values
func travel3(action: (String) -> String) { // (String) -> String
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel3 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
