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

