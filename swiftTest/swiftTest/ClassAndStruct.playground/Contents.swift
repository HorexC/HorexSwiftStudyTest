//: Playground - noun: a place where people can play

import UIKit

/**     Class And Struct : 类和结构体     */

struct Resolution {
    var width = 0
    var height = 0
}

class Video {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someVideo = Video()
someVideo.resolution.width = 10
someVideo

let vga = Resolution(width: 640, height: 480)

let resolution1 = Resolution(width: 1010, height: 1010)

var resolution2 = resolution1
resolution2.height = 2020

print("\(resolution1.height)")

let tenEighty = Video()
tenEighty.resolution = resolution2
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

if tenEighty === alsoTenEighty {
    print("equal")
}

/**     Properties : 属性     */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

rangeOfThreeItems.firstValue = 6

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 1

class DataImporter {
    var fileName = "data.text"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.fileName)

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)

print("\(square.origin.x), \(square.origin.y)")


struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

var cuboid1 = Cuboid(width: 1, height: 2, depth: 3)

cuboid1.volume

class StepCounter {
    var totalSteps:Int = 0 {
        willSet(newValue1) {
            print("\(totalSteps)---\(newValue1)")
        }
        didSet(oldValue2) {
            print("\(oldValue2)---\(totalSteps)")
        }
    }
}

var set = StepCounter()

set.totalSteps = 123


struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
    class var overrideableComputedTypeProperty: Int     {
        return 107
    }
}

SomeStructure.storedTypeProperty

SomeStructure.storedTypeProperty = "structure"

SomeStructure.storedTypeProperty

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

/**     Methods : 方法     */

class Counter {
    var count = 0
    func increment() {
        ++count
    }
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.incrementBy(5, numberOfTimes: 3)

struct Point1 {
    var x = 0.0, y = 0.0
    func isToRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point1(x: 4.0, y: 5.0)

if somePoint.isToRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low

ovenLight.next()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool{
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}


var player = Player(name: "Argyrios")
player.completedLevel(1)


/**     Subscripts : 下标脚本     */


struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("3的6倍是\(threeTimesTable[6])")

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * column) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

/**     Inheritance : 继承     */

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
    
    }
}

let someVehicle = Vehicle()

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

bicycle.currentSpeed = 15.0

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")


class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

/**     Initialization     */

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    init(_ celsius: Double) {
        self.red = celsius
        self.green = celsius
        self.blue = celsius
    }
}

let red = Color(23.0)



class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.response = "Yes, I do like cheese"

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

struct MySize {
    var width = 0.0, height = 0.0
}
struct MyPoint {
    var x = 0.0, y = 0.0
}

struct MyRect {
    var origin = MyPoint()
    var size = MySize()
    init() {}
    init(origin: MyPoint, size: MySize) {
        self.origin = origin
        self.size = size
    }
    init(center: MyPoint, size: MySize) {
        
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: MyPoint(x: originX, y: originY), size: size)
    }
}

class Vehicles {
    var numberOfWheel = 0
    var description: String {
        return "\(numberOfWheel) wheels"
    }
}

class bicycles: Vehicles {
    override init() {
        super.init()
        numberOfWheel = 2
    }
}

class Food  {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    convenience override init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) X \(name)"
        output += purchased ? "YES" : "X"
        return output
    }
}

var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Eggs", quantity: 6),
    ShoppingListItem2(name: "Bacon")
]



struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
            case "K":
                self = .Kelvin
            case "C":
                self = .Celsius
            case "F":
                self = .Fahrenheit
            default:
                return nil
        }
    }
}

class Product {
    let name: String!
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

class CartItem: Product {
    let quantity: Int!
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 { return nil }
    }
}

class SomeClass2 {
    required init() {
    
    }
}

class SomeSubClass2: SomeClass2 {
    required init() {
    
    }
}

struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}


/**     析构过程（Deinitialization）     */

struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinToVend: Int)  -> Int{
        numberOfCoinToVend = min(numberOfCoinToVend, coinsInBank)
        coinsInBank -= numberOfCoinToVend
        return numberOfCoinToVend
    }
    static func receiceCoins(coins: Int) {
        coinsInBank += coins
    }
}

class Player1 {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiceCoins(coinsInPurse)
    }
}







