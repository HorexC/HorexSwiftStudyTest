//: Playground - noun: a place where people can play

import UIKit

/**     Array     */

var someInts = [Int]()

print("someInts is of type [Int] with \(someInts.count) items.")


someInts.append(3)

someInts = []

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)

var sixDoubles = threeDoubles + anotherThreeDoubles


var shoppingList = ["Eggs", "Milk"]

var anotherShopList: [String] = ["meet", "oringe"]

var shoppingLists = shoppingList + anotherShopList

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")

shoppingList += ["Baking Powder"]

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
shoppingList.insert("Maple Syrup", atIndex: 0)

let mapleSyrup = shoppingList.removeAtIndex(0)

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(String(index + 1)): \(value)")
}


/**     Set     */

var letters = Set<Character>()

var array = Array<String>()

var favoriteGenres: Set = ["Rock", "Classical"]

//var favoriteGenres: Set<String> = ["Rock", "Classical"]

favoriteGenres.insert("Jack")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sort() {
    print("\(genre)")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sort()
oddDigits.intersect(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)

farmAnimals.isSupersetOf(houseAnimals)

farmAnimals.isDisjointWith(cityAnimals)

/**     Dictionary     */

var nameOfIntegers = [Int: String]()
nameOfIntegers[16] = "sixteen"

nameOfIntegers = [:]

var airports: [String: String] = ["YYZ": "Toronto Pearson"]

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty")
}

airports["LHR"] = "London"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

airports["APL"] = "Apple Internation"

airports["APL"] = nil

airports

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

let airportCodes = [String](airports.keys.sort())











