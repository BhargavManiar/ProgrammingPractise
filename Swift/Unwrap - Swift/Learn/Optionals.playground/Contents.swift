// Handling Missing Data

var age: Int? = nil // We can declare an empty data type with no contents, including not having value 0 in this case.
age = 40

// Unwrapping Optionals

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// Unwrapping with Guard

func greet(_ name: String?) { // note that with guard let if the parameter, (in this case 'name'), will terminate the function if it is nil.
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}


// Force Unwrapping

let str = "5"
let num = Int(str)! // In this case swift will chake if the value it gets from str is not an optional int, i.e it might be nil. In the case of nil value there will be a crash.

// Implicitly Unwrapping Optionals

let age2: Int! = nil // useful when a value will definately will be assigned a value later in its life. The advantage of this is that we don't have to use guards or if let

// Nil Coalesing

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous" // If the default value is set, in this case nil, then the "Anonymous" string will be used instead.

// Optional Chaining

let names = ["John", "Paul", "George", "Ringo"]
let beatles = names.first?.uppercased() // This is how an optional can be accessed, not the array declared can also be optional too.

// Optional Try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "pasword" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try?
checkPassword("password") {
        print("Result was \(result)")
} else {
    print("D'oh")
}

try! checkPassword("sekrit")
print("OK!")

// Failable Initializers
    // Sometimes we ahve falliable initialisers.

struct Person {
    var id : String
    init? (id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil // We could get no value or an invalid one in this case.
        }
    }
}


// Typecasting

class Animal { }
class Fish: Animal { }
class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog  {
        dog.makeNoise()
    }
}
