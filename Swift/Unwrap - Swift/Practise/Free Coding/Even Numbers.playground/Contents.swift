// Write code the loops from 1 through 100 to create an array of all even numbers
var evenNumber = [Int]()

for i in 1...100 {
    if i%2 == 0 {
        evenNumber.append(i)
    }
}
