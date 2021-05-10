import UIKit

// Protocols are a way of describing what properties and methods something must have.

// get and set here mean that the variable can be read and written to
protocol Identifiable {
    var id: String {get set}
}

// Struct that confirms to the Identifiable protocol
struct User: Identifiable {
    var id: String
}

// Function accepts an identifiable object
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
