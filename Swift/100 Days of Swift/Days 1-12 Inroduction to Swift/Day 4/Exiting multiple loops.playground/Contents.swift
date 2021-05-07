import UIKit

/*
// Here is an example of a normal loop

for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
    }
}
*/
 
// First a loop label is needed.
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
    
        if product == 50 {
            print("It's a buyllseye!")
            break outerLoop
        }
    }
}
