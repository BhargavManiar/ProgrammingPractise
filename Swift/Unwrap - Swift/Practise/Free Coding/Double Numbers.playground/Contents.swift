// Write code that doubles all the numbers in this array

let numbers = [1, 3, 5, 7, 9]

// A really fast way of doing this
let doubled = numbers.map{ $0 * 2 }
print(doubled)
