import UIKit

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Swift knows the parameter to the closure must be a string so we can remove it
travel { place -> String in
    return "I'm going to \(place) in my car"
}

// It also knows the closure must return a string so that can be removed too
travel { place in
    return "I'm going to \(place) in my car"
}

// As tehre is only one line, Swift permitts us to remove the return keyword
travel { place in
    "I'm going to \(place) in my car"
}

// We can go even shorter by removing 'place in'. Swift provides automatic names for closure's parameters
travel {
    "I'm going to \($0) in my car"
}





