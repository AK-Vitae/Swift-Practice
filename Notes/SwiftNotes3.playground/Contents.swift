// Basic Operators
// Assignment Operator
let b = 10
var a = 5
a = b
let (x,y) = (1,2)
// Basic Arithmetic: +, -, *, /, %
"hello, " + "world" // String concatenation
// Unary
let three = 3
let minusThree = -three
let plusThree = -minusThree // Unary Minus
let minusSix = -6
let alsoMinusSix = +minusSix // Unary Plus
// Comparison Operators: ==, !=, >, <, >=, <=
(1, "zebra") < (2, "apple") // True because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird") // True because 3 is equal to 3, and "apple" is less than "bird”
(4, "dog") == (4, "dog") // True because 4 is equal to 4, and "dog" is equal to "dog”
// Ternary Conditional Operators: question ? answer1 : answer2
let contentHeight = 40
let hasHeader = true
let rowHeight: Int
if hasHeader {
    rowHeight = contentHeight + 50
} else {
    rowHeight = contentHeight + 20
}
// Now as Ternary
let rowHeight2 = contentHeight + (hasHeader ? 50 : 20)
// Nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName // userDefinedColorName is nil, so colorNameToUse is set to the default of "red”
userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName // userDefinedColorName is not nil, so colorNameToUse is set to "green”
// Range Operators
// Closed Range Operator(a...b): a to and including b
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// Half-Open Range Operator(a..<b): a to and NOT including b
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// One-Sided Ranges
for name in names[2...] {
    print(name)
}
for name in names[...2] {
    print(name)
}
let range = ...5
range.contains(7) // false
range.contains(4) // true
range.contains(-1) // true”
// Logical Operators: !, &&, ||
let allowedEntry = false
if !allowedEntry { // If NOT allowedEntry is true = allowedEntry is false
    print("ACCESS DENIED")
}
