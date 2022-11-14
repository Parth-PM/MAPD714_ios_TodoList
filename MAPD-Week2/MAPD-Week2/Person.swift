import Foundation

class Person
{
    //instance variables(fields)
    private var name: String
    private var age: Int
    
    //properties
    var Age: Int{
        get{
            return self.age
        }
        set{
            self.age = newValue
        }
    }
    
    var Name: String{
        get{
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    
    //default Initializer
    init()
    {
        name = ""
        age = 0
    
    }
    
    //parameterized Initializer
    init(Name: String, Age: Int)
    {
        self.name = Name
        self.age = Age
    }
    
    func SaysHello()
    {
        print("\(self.name) says Hello!")
    }
}
