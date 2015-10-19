//: Playground - noun: a place where people can play

import UIKit


/**     assignment      */

let a = 5
var b = 10
b = a

let (x, y) = (1, 2)

-9 % -4

7 % 2.5

var i = 0

++i

var and = 1
and += 2

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

let defaultColorName = "red"
var userDefinedColorName: String?

var coloNameToUse = userDefinedColorName ?? defaultColorName
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]

let count = names.count

for i in 0..<count {
    print("第\(i+1)个人叫\(names[i])")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("welcome")
} else {
    print("ACCESS DENIED")
}

let hasDoorKey = false

let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("welcome")
} else {
    print("ACCESS DENIED")
}

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("welcome!")
} else {
    
}












