import UIKit

struct Game {
    var score: Int {
        didSet{
            print("Your score is now \(score)")
        }
    }
}
