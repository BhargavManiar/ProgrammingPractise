import UIKit

func mowGrass(to height: Double?) {
    guard let height = height else { return }
    print("Mowing the grass to \(height).")
}
mowGrass(to: 6.0)
