import UIKit

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

// Orignial object has been changed, as both singerCopy and singer point to the same object
print(singer.name)

/// If singer was a struct then we would get "Taylor Swift" printed out as the orignial and copy are seprate

/*
struct Singer {
    var name = "Taylor Swift"
}
*/
