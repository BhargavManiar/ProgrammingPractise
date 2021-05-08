import UIKit

struct Person {
    var name: String
    
    mutating func makeAnonyous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonyous()
