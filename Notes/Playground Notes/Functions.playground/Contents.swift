import UIKit

// Writing functions
func printHelp() {
    let message = """
Welcome to MyApp!

Run this app inside a directory of images and
MyApp will resize them all into thumbnails
"""
    
    print(message)
}
printHelp()

// Accepting Parameters
func square(number: Int) {
    print(number * number)
}

square(number: 8)

// Return Values
func square2(number: Int) -> Int {
    return number * number
}

let result = square2(number: 8)
print(result)

// Paremeter Labels: Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function.
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
sayHello(to: "AK")

// Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)!")
}
greet("AK")

// Default Parameters
func greet2(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}

greet2("AK")
greet2("AK", nicely: false)

// Variadic Functions: accept Any number of parameters of the same type
// You can make any parameter variadic by writing ... after its type
func square3(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
square3(numbers: 1, 2, 3, 4, 5)

// Writing throwing functions
// 1. Define an enum that describes the errors we can throw
enum PasswordError: Error {
    case obvious
}
// 2. Write a function that will throw the defined error if something goes wrong
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

// Running throwing functions:
// do starts a section of code that might cause problems
// try is used before every function that might throw an error
// catch lets you handle errors gracefully.
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// inout Parameters:
// All parameters passed into a Swift function are constants
// inout parameters can be changed inside your function
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum) // Need & becuase that is an explicit recognition that you’re aware it is being used as inout

