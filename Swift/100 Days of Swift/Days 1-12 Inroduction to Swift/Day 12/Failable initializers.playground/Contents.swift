import UIKit

let str = "5"

// This converts a string to an integer but as an optional.
let num = Int(str)

// This is a failable initialiser that might not work. They can be written into classes/ structs.

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

