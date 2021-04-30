let words = ["The", "rain", "in", "Spain"]

var capitalised = [String]()
for i in words {
    capitalised.append(i.uppercased())
}
print(capitalised)

// Empty array
capitalised = [];
print(capitalised)

// A faster method
capitalised = words.map{$0.uppercased()}
print(capitalised)
