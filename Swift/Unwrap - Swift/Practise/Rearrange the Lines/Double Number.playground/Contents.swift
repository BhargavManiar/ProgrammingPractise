import UIKit

func double(number:Int?) -> Int? {
    guard let number = number else {
        return nil
    }
    return number * 2
}

if let doubled = double(number: 5){
    print("The result was \(doubled).")
}
