// Write code that goes over this array, counting the number of time it contains the number 5, then printing that total.

let numbers = [1, 5, 2, 5, 3, 5]
var counter = 0;
for i in numbers {
    
    if i == 5{
        counter += 1;
    }
}

print(counter)
