import UIKit

// Function returns a closure, the closure must be called with a string and will return nothing.
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")

// This is technically allowable (to call the return value from travel()) but not recommended
let result2: Void = travel()("London")
