import UIKit

extension Int{
    func clamped(min: Int, max: Int) -> Int {
        if(self > max) {
            return max
        } else if (self < min) {
            return min
        }
        return self
    }
}
