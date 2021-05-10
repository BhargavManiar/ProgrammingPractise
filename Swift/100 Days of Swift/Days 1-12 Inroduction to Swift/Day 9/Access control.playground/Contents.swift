import UIKit

// Access control lets you restrict which code can use properties and methods.

struct Person {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    // Only a method inside the Persons struct can read the id property
    func identify() -> String {
        return "My social security number is \(id)"
    }
}
