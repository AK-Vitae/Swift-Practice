//The Basics

//Constants
let max = 10
let min = 2

//Variables
var x = 7
var y = 11
var z = 1
var a = 4, b = 5, c = 6

//Type annotations
var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double
red = 1.0
green = 2.0
blue = 3.0

//Printing
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

//Integers
let minValue = UInt8.min //8 bit
let maxValue = UInt8.max
var testInt:Int = 3
var testInt2 = 3
testInt = 4
//Doubles and Floats follow same logic
var decimal:Double = 3.14
var pi = 3.14159
let anotherPi = 3 + 0.14159 //inferred to be of type Double
//Numeric Literals
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDobule = 0xC.3p0
let paddedDouble = 000123.456
let oneMillion = 1_000_000
//Type Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let piTest = Double(three) + pointOneFourOneFiveNine
let integerPi = Int(piTest)


