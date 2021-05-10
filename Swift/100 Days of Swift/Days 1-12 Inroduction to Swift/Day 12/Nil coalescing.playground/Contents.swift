import UIKit

// Nil coalescing unwraps an optional and returns the value if there is one.

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous" // If false return Anonymous.
