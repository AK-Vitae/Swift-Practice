import UIKit

// var
var name = "Tim McGraw"
name = "Romeo"

// let - value cannot be changed
let nameTwo = "Taylor Swift"

// type annotations
var nameThree: String
nameThree = "Lebron James"
var percentage: Double = 99 // Even though value is an integer the type annotation will make the value a double

// type inferences
var color = "Red"
var age = 24
var isEducated = true

// String //
var quote = "Change the world by being yourself"
var burns = """
    The best laid schemes
    O' mice and men
    Gang aft agley
    """ // multi-line strings for cleaner presentation of longer strings


// numeric values //
// Int //
var numOne: Int = 3
var bigInt = 8_000_000
// Double or Float //
var numTwo: Double = 5.1234567 // Doubles are more precise
var numeThree: Float = -186.1234567 // Removes accuracy from the back of the number for the front

// Bool //
var stayOutTooLate: Bool = true
!stayOutTooLate
var nothingInBrain = true


// Operators //
var a = 10
a = a + 1
a = a - 1
a = a * a
a = a % 3

var name1 = "Tim Mcgraw"
var name2 = "Romeo"
var both = name1 + " and " + name2 // String concatenation

// comparison
var b = 1.1
var c = 2.2
var d = b + c
d > 3
d >= 3
d > 4
d < 4
name1 == "TIM Mcgraw" // Strings are case sensitive

// String interpolation
var car = "Honda"
var carYear = 2013
"My favorite car brnad is \(car)"
"Your car is \(2021-carYear) years old"
