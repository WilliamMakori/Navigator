import UIKit

var greeting = "Hello, playground"
struct employee {
    var name: String
    var id = UUID()
    
    // Mutating funcs can change the values of the properties of the struct.
    
    mutating func nameChange (newName: String){
         name = newName
        
    }
}



// If we don't assign a default value to the struct, we have to assign one when creating an instance of the struct
// structs can also have methods but these methods can't modify the properties of the struct unless they have the mutating tag before the declaration.


class Employee {
    init(){
        name = ""
        age = 0
    }
    
    var name:String
    var age: Int
    
}
var john = Employee() // Since we have assigned default values we don't have to initialize it in the instance definition

 
struct hashableStruct : Hashable{
    let name : String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name) // How does this work?
        // Primary function is that it creates a hash value for every instance of the struct created.
        // You have to in put a unique value each time so even the
        
    }
}
var kevin = hashableStruct(name: "Makori")
var peter = hashableStruct(name: "Makori")

print(kevin.hashValue)
print(peter.hashValue)

// Because the values for kevin and peter are identical, the hash values produced are identical so for the function to work, you have to pass in unique values each time.


