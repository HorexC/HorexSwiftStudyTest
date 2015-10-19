//: Playground - noun: a place where people can play

import UIKit

/**     Constant and variable     */
    
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

/**     String     */

var welcomeMessage: String
var red, green, blue:Double

let π = 3.14159
let 你好 = "Hello, world!"
let 🐶 = "dog"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Horex"

//let languageName = "Swift"
//languageName = "Swift++"

print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

// 这个是一个注释
/*
    这个是一个多行注释
*/

let cat = "🐱"; print(cat)

let minValue = UInt8.min
let maxValue = UInt8.max

/**     Type Inference     */

let meaningOfLife = 42
let pi = 3.14159

let anotherPi = 3 + 0.14159

/**     Hex     */

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

let decimalDouble = 12.1875
let expinentDouble = 1.21875e2
let hexadecimalDouble = 0xC.3p2

let oneMillion = 1_000_000

/**     Type Conversion     */

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let three = 3;
let pointOneFourOneFiveNine = 0.14159
let pi3 = Double(three) + pointOneFourOneFiveNine

/**     Type Aliases     */

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

/**     Boolean     */

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips")
} else {
    print("Eww, turnips are horrible")
}

/**     tuples : 元组     */

let http404Error = (404, "Not Found")

let (statusCode, statusMessage) = http404Error

print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")



print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")

print("The status code is \(http200Status.statusCode)")

/**     optionals : 可选      */

let possibleNumber = "asd"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404

serverResponseCode = nil

var surveryAnswer: String?

if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

/**     可选绑定 : optional binding     */

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), secondNumber = Int("41") where firstNumber < secondNumber
{
    print("\(firstNumber) < \(secondNumber)")
}

/**     error handling : 错误处理     */

func canThrowAnError() throws {

}

do {
    try canThrowAnError()
} catch {
    
}

/**     Assert : 断言     */

let age = -3

assert(age >= 0, "A person's age cannot be less than zero")















































