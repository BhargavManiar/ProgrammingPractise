import UIKit

struct Bicycle{
    var currentGear: Int
    mutating func changeGear(to newGear: Int){
        currentGear = newGear
        print("I'm now in gear \(currentGear)")
    }
}
