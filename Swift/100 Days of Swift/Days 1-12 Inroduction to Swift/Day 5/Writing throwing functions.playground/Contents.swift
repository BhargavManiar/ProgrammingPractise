import UIKit

// Throwing functions are useful for error handling


// Firstly define enum that describes the errors

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}
