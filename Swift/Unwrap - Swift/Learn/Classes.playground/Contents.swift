// Creating your own classes

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

let poppy = Dog(name: "Poppy", breed: "Poodle")

// Class inheritance

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle") // This is always needed by swift
    }
}

// Overriding methods

class Dog2 {
    func makeNoise() {
        print("Woof!")
    }
}

class Poodle2: Dog2 {
    override func makeNoise() {
        print("Yip!")
    }
}

let poppy2 = Poodle2()
poppy2.makeNoise()

// Final classes

    // Ensures that the class cannot be remade and that it remains constant
    // Final classes cannot be made

final class Dog3 {
    var name: String
    var breed: String
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}

// Copying objects

class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

//  Deinitalizers

class Person {
    var name = "John Doe"
    init() {
        print("\(name) is alive!")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    deinit {
        print("\(name) is no more!")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

//  Mutability

class Singer4 {
    var name = "Taylor Swift"
}

let taylor = Singer4()
taylor.name = "Ed Sheeran" // Notice how we have reassigned the class variable from Taylor Seift to Ed Sheeran.
print(taylor.name)
