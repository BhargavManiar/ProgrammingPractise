import UIKit

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't proivde a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}

var name: String?
greet(name)

name = "Bhargav"
greet(name)
