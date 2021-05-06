import UIKit

enum Planet: Int {
    case mercury
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2) // Get an enum case of the 3rd planet (Earth)


/// In the below example, one more more cases can be assigned a number. In this case we can start with 1 to count naturally
enum Planets: Int {
    case mercuary = 1
    case venus
    case earth
    case mars
}

let somePlanet = Planets(rawValue: 3) // The third planet is Earth

