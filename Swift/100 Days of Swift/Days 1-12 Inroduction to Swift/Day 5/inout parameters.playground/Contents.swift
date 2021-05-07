import UIKit

// Inouts are used update the value that is passed as a parameter, e.g pass by reference

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum) // & is used for an inout
