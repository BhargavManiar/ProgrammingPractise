import UIKit

// A range of numbers

// For Loops
let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["Red", "1989", "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}

print("Players")
for _ in 1...5 {
    print("play")
}

// While Loops

var number = 1
while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come")


// Repeat Loops

//Looks just like a do while loop
var number_2 = 1;
repeat {
    print(number_2)
    number_2 += 1
} while number_2 <= 20
print("Ready or not, here I come!")


// Exiting Loops

var countDown = 10
while countDown >= 0 {
    print(countDown)
    countDown -= 1
}
print("Blast off!")

var countDown_2 = 10
while countDown_2 >= 0 {
    print(countDown_2)
    if countDown_2 == 4 {
        print("I'm bored. Let's go now!")
    }
    countDown_2 -= 1
}


// Exiting Multiple Loops

for i in 1...10 {
    for j in 1...10 {
        let product = i*j
        print("\(i) * \(j) is \(product)")
    }
}

outerLoop: for i in 1...10 { // Notice that the enclosing loop is named 'outerLoop' in this case.
    for j in 1...10 {
        let product = i*j
        print("\(i) * \(j) is \(product)")
        break outerLoop
    }
}

// Skipping Items

for i in 1...10 {
    if i % 2 == 1 {
        continue // This operator will move to the next loop cycle and will skip everything after it in the loop.
    }
    print(i)
}


// Infinite Loops

var counter_3 = 0

while true {
    print(" ")
    counter_3 += 1
    if counter_3 == 273 {
        break
    }
}
