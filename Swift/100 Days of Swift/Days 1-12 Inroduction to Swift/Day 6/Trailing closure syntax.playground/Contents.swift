import UIKit

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}


// We can call travel() using trailing syntax like this
travel() {
    print("I'm driving in my car")
}

// As there are no other parameters we can use the following syntax
travel {
    print("I'm driving in my car")
}
