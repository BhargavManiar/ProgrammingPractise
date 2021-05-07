import UIKit

let driving = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

// The driving closure can run inside the travel function
travel(action: driving)
