//: Playground - noun: a place where people can play

import UIKit

/***      ARC      **/

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitedlized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var refenrence1: Person?
var refenrence2: Person?
var refenrence3: Person?

refenrence1 = Person(name: "John Appleseed")
refenrence2 = refenrence1
refenrence3 = refenrence1

refenrence2 = nil
refenrence3 = nil


refenrence1 = nil

var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil


//class Person {
//    let name: String
//    init(name: String) { self.name = name }
//    var apartment: Apartment?
//    deinit { print("\(name) is being deinitialized") }
//}
//
//class Apartment {
//    let unit: String
//    init(unit: String) { self.unit = unit }
//    weak var tenant: Person?
//    deinit { print("Apartment \(unit) is being deinitialized") }
//}
//
//
//var john: Person?
//var unit4A: Apartment?
//
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
//john!.apartment = unit4A
//unit4A!.tenant = john
//john = nil
// prints "John Appleseed is being deinitialized"

class Customer {
    let name: String?
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit{
        print("\(name) is being deinitialized")
    }
}


class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized")
    }
}

var john1: Customer?

john1 = Customer(name: "John Appleseed")
john1!.card = CreditCard(number: 1234_5678_9012_3456, customer: john1!)

john1 = nil

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")


class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil


/***      可空链式调用（Optional Chaining）      **/

class People {
    var residence: Residence?
}

class Room {
    let name: String
    init(name: String) { self.name = name}
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil {
            return buildingNumber
        } else {
            return nil
        }
    }
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of room is \(numberOfRooms)")
    }
    
    var address: Address?
}

let johns = People()

//let roomCount = johns.residence!.numberOfRooms
// this triggers a runtime error
if let roomCount = johns.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// prints "Unable to retrieve the number of rooms."

if let roomCount = johns.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
// prints "John's residence has 1 room(s)."

let jack = People()

if let roomCount = jack.residence?.numberOfRooms {
    print("has \(roomCount)")
} else {
    print("Unable to retrieve the number of rooms")
}

jack.residence = Residence()

let someAddress = Address()
someAddress.buildingNumber = " 29"
someAddress.street = "Acacia Road"
jack.residence?.address = someAddress

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72

let johnsAddress = Address()
johnsAddress.buildingName = " The Larches"
johnsAddress.street = "Laurel Street"

if let buildintIdentifier = jack.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    
}


