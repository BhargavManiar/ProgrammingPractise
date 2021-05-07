import UIKit

// Swift lets us provide two names for a parameter one for external use and one for internal.

//  Here is a normal example
func square(number: Int) -> Int {
    return number * number
}

let result = square(number: 8)

// Here is an example with labels for external use as well.
func SayHello(to name: String) {
    print("Hello, \(name)!")
}

SayHello(to: "Taylor") // Notive the label 'to'
