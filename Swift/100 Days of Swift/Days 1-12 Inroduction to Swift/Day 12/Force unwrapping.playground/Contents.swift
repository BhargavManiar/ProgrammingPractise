import UIKit

// Sometimes we know that a value is present, in this case we can use force unwrapping

let str = "5"

/// In this case Swift will immediately unwrap the optional an make num a regular in rather than an optional
let num = Int(str)!

let num2 = Int(str) // num2 here is an optional
