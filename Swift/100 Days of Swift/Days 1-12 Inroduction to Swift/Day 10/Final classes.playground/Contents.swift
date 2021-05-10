import UIKit

// The final keyword means that no other class can inherit from it

final class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name;
        self.breed = breed;
    }
}
