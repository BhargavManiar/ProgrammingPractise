import UIKit

struct City {
    var population: Int
    
    // Structs can have functions inside them
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()
