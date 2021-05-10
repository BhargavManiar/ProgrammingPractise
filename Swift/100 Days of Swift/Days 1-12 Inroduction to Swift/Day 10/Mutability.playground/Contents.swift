import UIKit

// In a struct that is declared as a constant, a variable property cannot be changed.

class Singer {
    var name = "Taylor Swift"
}


let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)

// To prevent a property being changed in a class, it can be declared as a constant
/*
class Singer {
    let name = "Taylor Swift"
}
 */
