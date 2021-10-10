import UIKit

// This code should track how many times a baseball player has swung their bat.

func swingBat() -> () -> Void {
    var swingCount = 0
    return {
        swingCount+=1
        if swingCount>=3 {
            print("You're out")
        } else {
            print("Strike\(swingCount)")
        }
    }
    
}
let swing = swingBat()

swing()
swing()
swing()
