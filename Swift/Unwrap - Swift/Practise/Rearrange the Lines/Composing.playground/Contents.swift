import UIKit

class Composer {
    func composeMusic() {
        print("Here's some music I wrote.")
    }
}


class OperaComposer: Composer {
    override func composeMusic() {
        print("Here's an opera I wrote.")
    }
}
let verdi = OperaComposer()
verdi.composeMusic()
