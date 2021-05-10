import UIKit


// Example without an initialiser
/*
struct User {
    var username: String
}

var user = User(username: "twostraws")

 */

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"
