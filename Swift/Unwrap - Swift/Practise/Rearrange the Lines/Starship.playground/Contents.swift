import UIKit

protocol Starship {
    func transport(number: Int)
}

extension Starship {
    func transport(number: Int) {
        print("\(number) to beam up - energize!")
    }
}
