//: Playground - noun: a place where people can play

import UIKit

/**     String     */

let someString = "Some string literal value"

/**     Initializing     */

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

var varialbleString = "Horse"
varialbleString += " and carriage"

for character in "Dog!🐶".characters {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)

var welcome = "hello"

let exclamationMark: Character = "!"
welcome.append(exclamationMark)


var word = "cafe"
print("the number of characters in \(word) is \( word.characters.count)")

word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

let greenting = "Guten Tag"
greenting[greenting.startIndex]

greenting[greenting.endIndex.predecessor()]
greenting[greenting.startIndex.successor()]

let index = greenting.startIndex.advancedBy(7)
greenting[index]


for index in greenting.characters.indices {
    print("\(greenting[index] )", terminator: " ")
}

var welcomes = "hello"
welcome.insert("@", atIndex: welcomes.endIndex)

welcome.removeAtIndex(welcome.endIndex.predecessor())

let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)


let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        ++act1SceneCount
    }
}

print("There are \(act1SceneCount) scenes in Act 1")

let dogString = "Dog‼🐶";
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}


for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}







