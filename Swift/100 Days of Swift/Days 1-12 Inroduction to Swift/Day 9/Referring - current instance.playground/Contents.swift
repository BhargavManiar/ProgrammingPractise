import UIKit

struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name // Self refers to the current instance of the struct
    }
}
