// Create a Player struct with a score integer property that thas a property observer so that whenever the score has changed it printes "The score is now" followed by the new score value.

struct Player{
    var score : Int {
        didSet {
            print("The score is now \(score)")
        }
    }
}

var x = Player(score: 0)
x.score = 1
