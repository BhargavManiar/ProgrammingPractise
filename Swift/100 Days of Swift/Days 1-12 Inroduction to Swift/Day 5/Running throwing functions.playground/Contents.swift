import UIKit

// From the previous tutorial

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

// do starts the sectoin of code
// try is used before a function that may throw an error
// catch is to handle errors

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
