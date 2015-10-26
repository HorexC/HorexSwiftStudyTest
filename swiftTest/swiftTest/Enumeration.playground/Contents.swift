//: Playground - noun: a place where people can play

import UIKit

/**     Enumeration     */

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPoint.West

directionToHead = .East

switch directionToHead {
case .North:
    print("North")
default :
    print("Ohter")
}

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}

var priductBarcode = Barcode.UPCA(8, 85909, 51226, 3)

priductBarcode = .QRCode("ABCDRF")

switch priductBarcode {
case .UPCA(let numberS, let manufa, let prod, let check):
    print("\(numberS),\(manufa),\(prod)")
case .QRCode(let pro):
    print("\(pro)")
}

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

enum Planet: Int {
    case Mercury = 1, Venus, Mars
}

enum CompassPoints: String {
    case North, South, East, West
}

let earthsOrder = Planet.Venus.rawValue

let sunsetDirection = CompassPoints.West.rawValue

let possiblePlanet = Planet(rawValue: 2)

let positionToPind = 9
if let somePlanet = Planet(rawValue: positionToPind){
    switch somePlanet {
    case .Venus:
        print("Venus")
    default:
        print("Not a safe")
    }
} else {
    print("not a position")
}

indirect enum ArithmeticExpression {
    case Number(Int)
    case Addtion(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case let .Addtion(left, right):
        return evaluate(left) + evaluate(right)
    case let .Multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addtion(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))

evaluate(product)







