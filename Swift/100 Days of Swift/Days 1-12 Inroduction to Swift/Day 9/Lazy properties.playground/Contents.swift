import UIKit


// For example this struct that requires time and resources
struct FamilyTree {
    init() {
            print("Creating family tree!")
    }
}

// The FamilyTree struct can be used a property inside a struct such as below
struct Person {
    var name: String
    
    // We can add the lazy so it is only created when it is first accessed
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

ed.familyTree
