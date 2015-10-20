//: Playground - noun: a place where people can play

import UIKit


/**     For-in     */

for index in 1...5 {
    print("\(index) time 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

answer

for var index = 9; index < 3; ++index {
    print("index is \(index)")
}

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var square = 0
var diceRoll = 0
//while square < finalSquare {
//    if ++diceRoll == 7 {
//        diceRoll = 1
//    }
//    square += diceRoll
//    if square < board.count {
//        square += board[square]
//    }
//}

print("Game over")

repeat {
    square += board[square]
    if ++diceRoll == 7 {
        diceRoll = 1
    }
    square += diceRoll
} while square < finalSquare

var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}


let someCharacter: Character = "e"
switch someCharacter {
    case "a", "e":
    print("\(someCharacter) is a vowel")
    case "b", "c":
    print("\(someCharacter) is a consonant")
    default:
    print("123")
}

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
default:
    naturalCount = "many"
}

naturalCount

let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("at the origin")
case (_, 0):
    print("on the x-axis")
case (-2...2,-2...2):
    print("inside the box")
default:
    print("outside of the box")
}

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("\(x),\(y) is on the line x == y")
case let (x, y) where x == -y:
    print("\(x),\(y) is on the line x == -y")
case let (x, y) :
    print("\(x),\(y) is on the line x == y")
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer"
}

description



//let finalSquare = 25
//var board = [Int](count: finalSquare + 1, repeatedValue: 0)
//board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
//board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//var square = 0
//var diceRoll = 0

//gameLoop: while square != finalSquare {
//    if ++diceRoll == 7 { diceRoll = 1}
//    switch square + diceRoll {
//    case finalSquare:
//        break gameLoop
//    case let newSquare where newSquare > finalSquare:
//        continue gameLoop
//    default:
//        square += diceRoll
//        square += board[square]
//    }
//}

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else
    {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location).")
}

greet(["name": "John"])

greet(["name": "John", "location": "Cupertino"])


if #available(iOS 7, *) {
    // 在 iOS 使用 iOS 9 APIs , 并且在 OS X 使用 OS X v10.10 APIs
    
    print("123")
    
} else {
    // 回滚至早前 iOS and OS X 的API
    print("321")
}
























