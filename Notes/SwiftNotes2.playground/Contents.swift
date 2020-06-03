import UIKit

//Booleans
let orangesAreOrange: Bool = true
let orangesAreOrange2 = true
let orangesAreBlue = false

let dogIsBarking = true
if dogIsBarking {
    print("Shhh, I am trying to sleep")
} else {
    print("Good dog")
}

//Tuples
let http404error = (404, "Not Found")
let userInfo = ("John", 23, 180.5)
let (Name, age, heightInCM) = userInfo // Decompose a tuple
print("\(Name)'s is \(age) years old and is \(heightInCM) tall")
let(justName,_,_) = userInfo // Ignore parts of a tuple with _
print("Hello my name is \(Name)")
print("My brother is \(userInfo.1 - 16) years younger than me") // Use tuple indices
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// Optionals: “An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.”
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) //Since this might fail the value is an Int?
var serverResponseCode: Int? = 404
serverResponseCode = nil // nil can only be used with optionals
if convertedNumber != nil {
    print("convertedNumber contains an \(type(of: convertedNumber))")
}
if convertedNumber != nil {
    print("convertedNumber contains an \(type(of: convertedNumber!))") // forced unwrapping with !
}
if let actualNumber = Int(possibleNumber) { // Optional binding
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
} // ! is not necessary as the constant is being set to the accessed Int? value
if let firstNumber = Int("4"),
    let  secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // force-unwrapped
let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString
print(type(of: implicitString)) // has explicit, non-optional type string
let optionalString = assumedString
print(type(of: optionalString)) // Is of type String? as it is not being force-unwrapped
