// Writing Functions

func printHelp() {
    let message = """
    Welcome to MyApp@
    Run this app inside a directory of images and MyApp will resize them asll into thumbnails
    """
    
    print(message)
}

printHelp()

// Accepting Parameters

func square(number: Int) {
    print(number * number)
}

square(number: 8)

// Returning Values

func square_2(number: Int) -> Int {
    return number * number
}

let result = square_2(number: 8)
print(result)

// Parameter Labels

func sayHello(to name: String) { // Notice that this fucntion parameter has two names one to use internally, local to the fuction; and one external.
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

// Omitting Parameter Labels

func greet(_ person: String)
{
    print("Hello, \(person)!")
}

greet("Taylor") // Notice how the label in this case can be removed. This however, makes it harder to read.

// Default Parameters

func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
// This function can be called in two ways .


greet("Taylor")
greet("Taylor", nicely: false)

// Variadic Functions 

// Variadic funcrions accept many parameters such as the print function
print("Haters", "Gonna", "Hate")

func square_3(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number*number)")
    }
}
square_3(numbers: 1,2,3,4,5)

// Throw functions
// used for error handeling

enum PasswordError: Error { // 1st We need an enum that can describes the errors we can have
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true;
}

// Running throw functions
do {
    try checkPassword("password")
    print("That password is good") // If no error is thrown
} catch {
    print("You can't use that password") // If an error occurs this happens
}


// INOUT Parameters
// Parameter references the original refered address of the variable used

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10 // A variable needs to be used not a ocnstant
doubleInPlace(number: &myNum)
