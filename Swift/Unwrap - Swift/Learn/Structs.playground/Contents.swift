// Creating Your Own Structs
    // Variables in a struct are called properties
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

// Computed Properties

struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    var olympicStatus: String { // Notice here we can use the former variabels to compute the value of olympicStatus
        if isOlympicSport {
            return "\(name) is an Olympic Sport"
        } else {
            return  "\(name) is not an Olympic Sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chess", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// Property Observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// Methods
struct City {
    var population : Int
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let London = City(population: 9_000_000)
London.collectTaxes()

// Mutation Methods
struct Person {
    var name : String
    mutating func makeAnonymous(){
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()

// Properties and Methods of Strings

    // Strings are actually structs
let string = "Do or do not there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// Properties and Methods of Arrays

    // Arrays are also structs
var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)

// Initializers

struct User {
    var username: String
}

var user = User(username: "twostraws")

struct User2 {
    var username: String
    init() {
        username = "Anonymous"
        print("Create a new user!")
    }
}

var user2 = User2() // This will call the init function
user.username = "twostraws"

// Referring to The Current Instance

struct Person2 {
    var name: String
    init(name: String){
        print("\(name) was born!")
        self.name = name // Become aware of the fact that we are explicitly refering to the name variable in the struct
    }
}

// Lazy Properties
    // Information is only created when it is needed, as a result we have better performance.
    
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}
    // The family tree struct can be used inside another struct.
struct Person3 {
    var name: String
    lazy var familyTree = FamilyTree()
    init(name: String) {
        self.name = name
    }
}
var ed = Person3(name: "Ed")
ed.familyTree

// Static Properties and Methods
struct Student {
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
}

let eddie = Student(name: "Eddie")
let taylor = Student(name: "Taylor")

struct Student2 {
    static var classSize = 0 // This variable can be accessed across all instances
    var name: String
    init(name: String) {
        self.name = name
        Student2.classSize += 1
    }
}

print(Student2.classSize)

// Access Control
    // Using private methods

struct Person4 {
    var id: String
    init(id: String) {
        self.id = id
    }
}

let edward = Person4(id: "12345")

struct Person5 {
    private var id: String
    init(id: String) {
        self.id = id
    }
    func identity() -> String {
        return "My social security number is \(id)"
    }
}

// This way the variable id cannot be referenced directly

let bobby = Person5(id: "Bob")
let socialSecurity = bobby.identity()
