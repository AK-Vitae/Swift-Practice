import UIKit

var greeting = "Hello, playground"

// For Loops
let count = 1...10
for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna ")
for _ in 1...5 { // Minimizes needless values
    print("play")
}

// While Loops
var number = 1
while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come!")

// Repeat Loops: Because the condition comes at the end of the repeat loop the code inside the loop will always be executed at least once
var number2 = 1
repeat {
    print(number2)
    number2 += 1
} while number2 <= 20
print("Ready or not, here I come!")

// Exiting a Loop: break
var countDown = 10
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}

// Exiting Multiple Loops
outerLoop: for i in 1...10 { // Give a label to the outer loop
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

// Skipping items: continue
for i in 1...10 {
    if i % 2 == 1 {
        continue
    }

    print(i)
}

// Infinite Loops
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}
