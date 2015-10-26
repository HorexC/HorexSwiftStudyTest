//: Playground - noun: a place where people can play

import UIKit

/**     Closures : 闭包     */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sort(backwards)
    
//{
//    (parameters) -> returnType in
//        statements
//}

reversed = names.sort({
    (s1: String, s2: String) -> Bool in
     return s1 > s2
})

reversed = names.sort({
    s1, s2 in return s1 > s2
})

reversed = names.sort({
    s1, s2 in s1 > s2
})

reversed = names.sort({
     $0 > $1
})


reversed = names.sort(>)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map(){
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runnintTotal = 0
    func increment() -> Int {
        runnintTotal += amount
        return runnintTotal
    }
    return increment
}


let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()

incrementByTen()

incrementByTen()










