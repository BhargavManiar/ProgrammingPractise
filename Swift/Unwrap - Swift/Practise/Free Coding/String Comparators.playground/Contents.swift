// Write a function that accespts two string and returns true if they are both thesame regardless of what letter case they use.

func compareStrings(x : String, y : String) -> Bool {
    return (x.lowercased() == y.lowercased())
}

compareStrings(x: "hello", y: "Hello");
compareStrings(x: "hi", y: "Hello");
