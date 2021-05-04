import UIKit


// Arithmetic Operators
let firstScore = 12;
let secondScore = 4;

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

let remainder = 13 % secondScore // Obtain the remainder of a division of 13 and secondScore


// Operator Overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna" // Concatenation of strings
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf


// Compond assignment operators
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// Comparison Operators

let firstScore_2 = 6
let secondScore_2 = 4

firstScore_2 == secondScore_2
firstScore_2 != secondScore_2

firstScore_2 < secondScore_2
firstScore_2 >= secondScore_2

"Taylor" <= "Swift"

// Conditions
let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces - lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
}
else {
    print("Regular cards")
}

// Combined Conditions

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18 {
    print("Both are over 18")
}

if age1 > 18 || age2 > 18 {
    print("At least one is over 18")
}


// Ternary Operator
let firstCard_1 = 11
let secondCard_1 = 10
print(firstCard_1 == secondCard_1 ? "Cards are the same" : "Cards are different")

// This line above is the same as the if else statement below

if firstCard_1 == secondCard_1 {
    print("Cards are the same")
} else {
    print("Cards are different")
}

// Switch statements

let weather = "Sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear subscreen")
default:    // Good practise and required by swift
    print("Enjoy your day!")
}

switch weather {
case "rain":
    print("Bring and umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear suncreen")
    fallthrough
default:
    print("Enjoy your day!")
}

// Range Operators

let score_1 = 85
switch score_1 {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
