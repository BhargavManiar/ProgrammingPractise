import UIKit

struct Student {
    // Static means a variable can be shared with multiple instance of the same class
    static var classSize = 0
    var name: String
    
    init(name: String){
        self.name = name
        Student.classSize += 1
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize) // classSize belongs to the struct itself not to any instance
