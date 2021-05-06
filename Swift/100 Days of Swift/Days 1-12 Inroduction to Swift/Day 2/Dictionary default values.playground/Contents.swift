import UIKit

// If a key doesn't exist use a default value

let favouriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favouriteIceCream["Paul"]
favouriteIceCream["Charlotte"] // Notice here tehe return value is nil
favouriteIceCream["Charlotte", default: "Unknown"] // Here the returned value is Unknown

