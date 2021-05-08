import UIKit

struct Sport {
    var name: String
    var isOlymmicSport: Bool
    
    // The computed property
    var olympicStatus: String {
        if isOlymmicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlymmicSport: false)
print(chessBoxing.olympicStatus)
