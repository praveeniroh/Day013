import Cocoa

protocol Vehicle {
    var numberOfWheels: Int { get }
    var color: String { get set }
    
    func start()
    func stop()
    mutating func updateColor()
}

struct Car: Vehicle {
    var numberOfWheels: Int = 4
    var color: String = "Red"
    
    func start() {
        print("Car engine started")
    }
    
    func stop() {
        print("Car engine stopped")
    }
    
    mutating func updateColor(){
        color = ["Bule","Red","Black","White"].randomElement()!
        print("New color:\(color)")
    }
}

struct Motorcycle: Vehicle {
    var numberOfWheels: Int = 2
    var color: String = "Black"
    
    func start() {
        print("Motorcycle engine started")
    }
    
    func stop() {
        print("Motorcycle engine stopped")
    }
    
    mutating func updateColor(){
        color = ["Black","White"].randomElement()!
        print("New color:\(color)")
    }
}

var car = Car()
//car.numberOfWheels = 10
print("Car color: \(car.color)")
car.start()
car.stop()
car.updateColor()

var motorcycle = Motorcycle()
print("Motorcycle color: \(motorcycle.color)")
motorcycle.start()
motorcycle.stop()
motorcycle.updateColor()

//Using constant
protocol MyProtocol {
    var constantProperty: Int { get }
}

struct MyStruct: MyProtocol {
    let constantProperty: Int = 10
}

let myStruct = MyStruct()
print(myStruct.constantProperty)

//myStruct.constantProperty = 20

//Opaque return types
protocol Animal {
    func makeSound()
}

struct Dog: Animal {
    func makeSound() {
        print("Woof!")
    }
}

struct Cat: Animal {
    func makeSound() {
        print("Meow!")
    }
}

func getDog()-> some Animal{
    return Dog()
}
func getCat()-> some Animal{
    return Cat()
}

for _ in 0...5{
    let random = Int.random(in: 0...1)
    let animal:Animal = random == 0 ? getDog() : getCat()
    animal.makeSound()
}



//Extensions:

struct Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

//Confirming protocol
protocol Greetable {
    var name:String{get set}
    func greet() -> String
}

extension Person: Greetable {
    func greet() -> String {
        return "Hello, my name is \(name) and I'm \(age) years old."
    }
}
var person = Person(name: "John Doe", age: 25)
print(person.greet())

//Adding new functions
extension Person {
    mutating func celebrateBirthday() {
        age += 1
        print("Happy birthday to me! Now I'm \(age) years old.")
    }
}
person.celebrateBirthday()

//Nested types
extension Person {
    enum Gender {
        case male
        case female
        case other
    }
    
    struct Address {
        var street: String
        var city: String
        var country: String
    }
}
let gender = Person.Gender.male
let address = Person.Address(street: "123 Main St", city: "New York", country: "USA")

//Defining Computed property
extension Person {
    var isAdult: Bool {
        return age >= 18
    }
}
print(person.isAdult)

//Defining new subscript
extension Person {
    subscript(index: Int) -> String {
        switch index {
        case 0:
            return name
        case 1:
            return "\(age)"
        default:
            return ""
        }
    }
}
print(person[0])
print(person[1])

//Defining new init for struct(it won't affect the member-wise init)
extension Person {
    init(name: String) {
        self.name = name
        self.age = 0
    }
}

let personWithNameOnly = Person(name: "Alice")
print(personWithNameOnly.greet())




//extending protocol

extension Greetable {
    func greet() -> String {
        return "Hello! \(name)"
    }
}

struct Employee:Greetable{
    var name:String
}
let emp1 = Employee(name: "Vandu murugan")
print(emp1.greet())


//check point
protocol Building{
    var noOfRooms:Int{get set}
    var cost:Int{get set}
    var agentName:String{get set}
    func salesSummery()->String
}

extension Building{
    func salesSummery()->String{
        return "Number of rooms: \(noOfRooms)\ncost of the property : \(cost)\nsellers name:\(agentName)"
    }
}

struct House:Building{
    var noOfRooms: Int
    
    var cost: Int
    
    var agentName: String
    
}

let house = House(noOfRooms: 3, cost: 50000, agentName: "Kaipulla")
print(house.salesSummery())


struct Office:Building{
    var noOfRooms: Int
    
    var cost: Int
    
    var agentName: String
    
    func salesSummery() -> String {
        return "\n**** Office Building ***\n"+"Number of rooms: \(noOfRooms)\ncost of the property : \(cost)\nsellers name:\(agentName)"
    }
}

let office = Office(noOfRooms: 3, cost: 50000, agentName: "Kaipulla")
print(office.salesSummery())
