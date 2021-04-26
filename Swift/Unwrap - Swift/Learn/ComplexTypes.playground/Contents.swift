import UIKit



// Arrays

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"
let beatles = [john, paul, george, ringo]

// Sets

let colours = Set(["red", "greed", "blue"])
let colours2 = Set(["red", "greed", "blue", "red", "blue"]) // Notice here that red and blue repeat but the repeats are not part of the final set

// Tuples

    // Think of these as dictonaries in python, note this is not the same as swift dictionaries
var name = (first : "Taylor", last: "Swift")

    // This is how we can access them
name.0
name.first


// Uses for the above complex types

let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville"); // Each index contains a variable with an associated value
let set = Set(["aardvark", "astronaut", "azalea"]);                           // Can only contain unique entries
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"];        // Can Contain duplicate entries


// Dictionaries

// This is a dictionary in swift
let heights = [
    "Taylor Swift" : 1.79,
    "Ed Sheeran" : 1.73
]

// The string is the key


// Default value for a dictionary

let favouriteIceCream = [
    "Paul" : "Chololate",
    "Sophie" : "Vanilla",
]

favouriteIceCream["Charlotte", default : "Unknown"]; // Note, we are attempting to get the value from key "Charlotte", that key doesn't exist.
                                                     // A defualt value will give a declared value you want.

// Creating empty collections
var teams = [String: String]()
teams["Paul"] = "Red"
var results = [Int]()  // Empty Array

// Creating an Empty Set
var words = Set<String>()
var numbers = Set<Int>()

// Creation of arrays and dictionaries with a similar format
var scores = Dictionary<String, Int>()
var results2 = Array<Int>()


// Enumerations

// There are three different strings, different meanings
let resultOne = "failure"
let resultTwo = "failed"
let resultThree = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure;

// Enum Associated Values
// We can add additional values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "Sports")


// Enum Raw Values
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2) // If not already designated it will be assigned to 0



