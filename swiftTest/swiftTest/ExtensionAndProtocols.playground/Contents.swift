//: Playground - noun: a place where people can play

import Cocoa

/***      Extensions : 扩展      **/


extension Double {
    var km: Double {  return self * 1_000.0  }
    var m : Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}


let oneInch = 25.4.mm

let aMarathon = 42.km + 195.m

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))

extension Int {
    func repetitions(task: () -> ()){
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions { () -> () in
    print("Hello!")
}

2.repetitions{
    print("Goodbye!")
}

extension Int  {
    mutating func square() {
        self = self * self
    }
}


var someInt = 3
someInt.square()

extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        }
        return (self / decimalBase) % 10
    }
    
}

7812812[3]

extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}



/***      Protocols      **/

protocol FullyName {
    var fullName: String { get }
}

struct Person: FullyName {
    var fullName: String
}

var john = Person(fullName: "John Appleseed")

john.fullName = "1234"

print("\(john.fullName)")

class Starship: FullyName {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")



protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 1399.0
    let a = 3877.0
    let c = 295.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case .Off:
            self = On
        case .On:
            self = Off
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()

class Str: Togglable {
    func toggle() {
        
    }
    init() {
        
    }
}


struct Struc: Togglable {
    mutating func toggle() {
        self = Struc()
    }
}

protocol SomeProtocol {
    init(someParameter: Int)
}

class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        
    }
}



class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

 protocol DiceGame {
    var dice: Dice { get }
    func play()
    
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
//    optional func incrementForCount(count: Int) -> Int
//    optional var fixedIncrement: Int { get }
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self,didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class Counte: NSObject {
    
}

//@objc protocol CounterDataSource {
//    optional func incrementForCount(count: Int) -> Int
//    func gameDidStart(game: Counte) -> Int
//    var dice: Counte { get }
//}
//
//
//class Counter {
//    var count = 0
//    var dataSource: CounterDataSource?
//    func increment() {
//        if let amount = dataSource?.incrementForCount?(count){
//            count += amount
//        } else if let amount = dataSource?.gameDidStart(Counte()) {
//            count += amount
//        }
//    }
//}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        ++numberOfTurns
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}


class Overload {
    func createBy(name: String) {
        
    }
    func createBy(name: String, age: String) {
        
    }
    func createBy(name: Int) {
        
    }
}



protocol TextRepresentable {
    var textualDescripition: String { get }
}

extension Dice: TextRepresentable {
    var textualDescripition: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())

print(d12.textualDescripition)


struct Hamster {
    var name: String
    var textualDescripition: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}


let simonTheHamster = Hamster(name: "Simon")

let somethingTextRepresentable: TextRepresentable = simonTheHamster

let things: [TextRepresentable] = [d12, simonTheHamster]

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextRepresentable: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var textualDescripition: String {
        return "123"
    }
    var prettyTextRepresentable: String {
        var output = textualDescripition + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲ "
            case let snake where snake < 0:
                output += "▼ "
            default:
                output += "○ "
            }
        }
        return output
    }
}

protocol SomeClassOnlyProtocol: class, PrettyTextRepresentable {
    
}

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Persons: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)!")
}

let brithdayPerson = Persons(name: "Malcolm", age: 21)

wishHappyBirthday(brithdayPerson)

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}


class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}


let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]

if Animal(legs: 4) is HasArea {
    
} else {
    print("123")
}

if let objectWithArea = Circle(radius: 2.0) as? HasArea {
    
}

@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}


@objc class Counter: NSObject {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}


@objc class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}


var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: CounterDataSource {
    @objc func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}


extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescripition
    }
}

extension CollectionType where Generator.Element : TextRepresentable {
    
}






