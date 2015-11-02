//: Playground - noun: a place where people can play

import Cocoa

/***      Advanced Operatiors      **/

let initialBits = 0b00011111
let invertedBits = ~initialBits

let firstSixBits: UInt = 0b11111100
let lastSixBits: UInt = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

let someBits: UInt = 0b10110010
let moreBits: UInt = 0b01011110
let combinebits = someBits | moreBits

let firstBits = 0b00010100
let otherBits = 0b00000101
let outputBits = firstBits ^ otherBits


let shiftBits: UInt = 4
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits >> 2


var potentialOverflow = Int16.max

//potentialOverflow += 1

potentialOverflow = potentialOverflow &+ 1



struct Vector2D {
    var x = 0.0, y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let another = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + another


var x = 1 + 2

 prefix func - (ventor: Vector2D) -> Vector2D {
    return Vector2D(x: -ventor.x, y: -ventor.y)
}

postfix func -- (ventor: Vector2D) -> Vector2D {
    return Vector2D(x: -ventor.x, y: -ventor.y)
}

func == (left: Vector2D, right: Vector2D)-> Bool {
    return (left.x == right.x) && (left.y == right.y)
}

infix operator +- { associativity left precedence 140 }

func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector



















