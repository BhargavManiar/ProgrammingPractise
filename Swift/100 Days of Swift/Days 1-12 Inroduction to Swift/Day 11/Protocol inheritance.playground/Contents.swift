import UIKit

protocol Payable {
    func calculateWages() -> Int
}
protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takevacation(days: Int)
}

// This protocol inherets all of the above protocols
protocol Employee: Payable, NeedsTraining, HasVacation {}
