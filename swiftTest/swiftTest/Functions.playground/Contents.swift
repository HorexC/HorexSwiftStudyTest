//: Playground - noun: a place where people can play

import UIKit

/**     Funtions     */

func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("Anna"))

func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

halfOpenRangeLength(1, end: 9)

func sayHelloWorld() -> String {
    return "Hello, world"
}

sayHelloWorld()

func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}
sayGoodbye("Dave")

/**     多重返回值函数（Functions with Multiple Return Values）     */

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax([8, 9, -1, 108])

bounds




func sayHello(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
print(sayHello(to: "Bill", and: "Ted"))
// prints "Hello Bill and Ted!"

func someFunction(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(1, 2)



func someFunction(parameterWithDefault: Int = 12) {
    
}

someFunction()



func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)


func alignRight(var string string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}

let originalString = "hello"
let paddedString = alignRight(string: originalString, totalLength: 10, pad: "-")

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)

print("\(someInt) and \(anotherInt)")

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFuntion: (Int, Int) -> Int = addTwoInts

mathFuntion(2, 3)

mathFuntion = multiplyTwoInts

mathFuntion (2, 3)

func printMathResult(mathFuntion: (Int, Int) ->  Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFuntion(a, b))")
}

printMathResult(mathFuntion, 3, 4)


func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}


var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

while currentValue != 0 {
    currentValue = moveNearerToZero(currentValue)
}

currentValue

//func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
//    func stepForward(input: Int) -> Int { return input + 1 }
//    func stepBackward(input: Int) -> Int { return input - 1 }
//    return backwards ? stepBackward : stepForward
//}
//var currentValue = -4
//let moveNearerToZero = chooseStepFunction(currentValue > 0)
//// moveNearerToZero now refers to the nested stepForward() function
//while currentValue != 0 {
//    print("\(currentValue)... ")
//    currentValue = moveNearerToZero(currentValue)
//}
//print("zero!")















