import UIKit

var number = 1

repeat {
    print(number)
    number += 1
} while number <= 20


print("Ready or not, here I come!")

// Cannot run, xcode will warn us that it will never be executed
while false {
    print("This is false")
}

// This will only run once as the condition comes after
repeat {
    print("This is false")
} while false
