import UIKit

struct XWing{
    var callSign: String
    func shouldAttackDeathStar() -> Bool{
        if callSign == "Red 5" {
            return true
        } else {
            return false
        }
    }
}
