import UIKit


// ..< ranges up to but excluding the final value
// ... ranges up to an including the final values

let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
