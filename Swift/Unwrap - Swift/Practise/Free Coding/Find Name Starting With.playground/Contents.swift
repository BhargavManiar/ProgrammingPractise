// Write code that creates an array containing all the people with the first name Terry.
let names = ["Terry Jones", "John Terry", "Terry Crews", "Terry Farrell", "Samuel Terry"]

var people = [String]()

for i in names {
    if i.hasPrefix("Terry") {
        people.append(i);
    }
}

print(people)
