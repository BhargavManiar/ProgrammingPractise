

// Creating basic closures

let driving = { // A function can be defined as a variable
    print("I'm driving in my car")
}

driving()  // the variable driving is called as a funciton


// Accepting parameters in a closure

let driving2 = { (place: String) in
    print ("I'm going to \(place) in my car")
}

driving2("London")

// Return values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// Closures as parameters
// As closures behave as variables they can be passed in to normal functions

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I've arrived!")
}
travel(action: driving)

// Trailing Closure Syntax
travel() { // The parenthesis can be removed if there are no parameters to take
    print("I'm driving in my car")
}

// Using closures as parameters when they accept parameters
func travel2(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived")
}

travel2 { (place: String) in // Here the code is required to accept a string
    print("I'm going to \(place) in my car")
}

// Using closures as parameters when they return values

func travel3(action: (String) -> String) {
    print("I'm getting ready to go")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel3 { (place: String) -> String in // Notice from the prior this one uses a retun statement
    return "I'm going to \(place) in my car"
}

// Shorthand parameter names
func travel4(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel4 { place -> String in // We have removed the parameter to the closure
    return "I'm going to \(place) in my car"
}

travel4 { place in  // Removed the return type
    return "I'm going to \(place) in my car"
}

travel4 { place in // Removed the return statement
    "I'm going to \(place) in my car"
}

travel4 { // Removed teh parmeter
    "I'm going to \($0) in my car"
}

// Closures with multiple parameters

func travel5(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London",60)
    print(description)
    print("I arrived!")
}

travel5 {
    "I'm going to \($0) at \($1) miles per hour"
}

// Returning closures from functions

func travel6() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel6()
result("London")

let restult2 = travel6()("London")


// Capturing values
func travel7() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

// The counter value is captured by the closure so it will remain 'alive' for that closure
let result3 = travel7()

result3("London")
result3("London")
result3("London")

