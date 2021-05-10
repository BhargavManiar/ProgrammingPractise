import UIKit

// When using an optional there is a change there is no value, hence, unwrapping is used.
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}
