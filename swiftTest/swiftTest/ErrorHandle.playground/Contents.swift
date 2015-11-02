//: Playground - noun: a place where people can play

import Cocoa

enum VendingMachineError: ErrorType {
    case InvalidSelection   //选择无效
    case InsufficientFunds(coinsNeeded: Int)    //金额不足
    case OutOfStock         //缺货
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }
    
    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
    }
}


let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Invalid Seletion.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock")
} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}

class Data {
    
}

func fetckDataFromDisk () throws -> Data{
    throw VendingMachineError.InvalidSelection
}

func fetchData() -> Data? {
    if let data = try? fetckDataFromDisk() { return data }
    return nil
}

func loadImage(name: String) throws -> String {
    return name
}

let photo = try! loadImage("name")

//func processFile(fileName: String) throws {
//    if exists(fileName) {
//        let file = open(fileName)
//        defer {
//            close(fileName)
//        }
//        while let line = try file.readline() {
//            
//        }
//        // 最后调用 close(file)
//    }
//}

