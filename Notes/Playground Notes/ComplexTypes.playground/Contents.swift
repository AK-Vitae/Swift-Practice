import UIKit

// Arrays
var evenNumbers = [2, 4, 6, 8]
var songs = ["Boombayah", "As If It's Your Last", "Whistle"]
songs[0]
songs[2]
type(of: songs)

var stringArray: [String] = [] // array designated for strings
var anyArray: [Any] = [] // array designated for any type

// Operators on Arrays
var songs1 = ["Boombayah", "As If It's Your Last", "Whistle"]
var songs2 = ["DuX4", "HYLT", "Lovesick Girls"]

var both = songs1 + songs2
both += ["Everything has changed"]
print(both)

// Sets
// 1. Items aren’t stored in any order; they are stored in what is effectively a random order.
// 2. No item can appear twice in a set; all items must be unique.
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

// Tuples
// 1. You can’t add or remove items from a tuple; they are fixed in size.
// 2. You can’t change the type of items in a tuple; they always have the same types they were created with.
// 3. You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
var name = (first: "Taylor", last: "Swift")
name.0
name.first
// Changing values in a tuple
name.first = "justin"
name.last = "beaver"

// Arrays vs Sets vs Tuples
// If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
// If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
let set = Set(["aardvark", "astronaut", "azalea"])
// If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

// Dictionaries: Key-value pairs
var person = [
                "first": "Rose",
                "second": "Jennie",
                "third": "Lisa",
                "fourth": "Jisoo"
            ]
person["third"]
person["Miyeon", default: "Not in Dictionary"] // Reading a value not in dictionary will return nil so a default value can be provided

// Empty Collections
var cars = [String]() // [String] = [] // Empty array
var teams = [String: String]() // Empty dictionary
teams["Paul"] = "Red" // Input into the empty dictionary
teams
var words = Set<String>() // Empty set syntax for type String
var numbers = Set<Int>()

// Enumerations or Enum: a way of defining groups of related values in a way that makes them easier to use
enum Result {
    case success
    case failure
}
let result = Result.failure
// Enum associated values: lets you attach additional information to your enums so they can represent more nuanced data
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")
// Enum raw values
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
} // Swift will automatically assign each of those a number starting from 0 unless otherwise given (in this case the count will start from 1)
let earth = Planet(rawValue: 3)
