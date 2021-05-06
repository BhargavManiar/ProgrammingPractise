import UIKit


/*
// Example of enum that stores different activities
enum Activity {
    case bored
    case running
    case talking
    case singing
}
*/

// Example with enum with additional details
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")
