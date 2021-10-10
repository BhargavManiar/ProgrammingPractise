import UIKit

class Bird {
    var wingspan: Double? = nil
}
class Eagle: Bird {}
let bird = Bird()
if let eagle = bird as? Eagle {
    if let wingspan = eagle.wingspan {
        print("The eagle's wingspan is \(wingspan).")
    } else {
        print("This eagle has an unknown wingspan.")
    }
}
