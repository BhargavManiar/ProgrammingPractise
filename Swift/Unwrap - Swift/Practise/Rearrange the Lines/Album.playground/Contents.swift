import UIKit

let albums = ["Reputation", "Red", "1989"]
if let position = albums.firstIndex(of: "Red") {
    print("Found Red at position \(position).")
} else {
    print("Red wasn't in the array.")
}

