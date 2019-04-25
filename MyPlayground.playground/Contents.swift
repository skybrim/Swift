import UIKit

var str = "Hello, playground"

let a: Float = 4

let label = "The width is"
let width = 94
let widthLabel = label + String(width)
let widthLabel2 = "The width is \(width)"

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("celery")
case "cucumber", "watercress":
    print("cucumber")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tastes good in soup")
}

var total = 0
for i in 1...4 {
    total += i
}
print(total)

print(4 + 0.1)

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("convertedNu,ber has a integer value of \(convertedNumber!)")
}

let testMessage1: String
testMessage1 = "abc"
print(testMessage1)

let defaultColor = "red"
var userCustomColor: String?
userCustomColor = "blue"
var color = userCustomColor ?? defaultColor

let range = ...5
range.contains(7)

var someString: String
someString = "abc\t123\ndef"
print("\n第一种\n" + someString)
someString = """
abc
123
def
"""
print("\n第二种\n" + someString)
someString = """
abc\
123\
def
"""
print("\n第三种\n" + someString)

someString[someString.startIndex]

someString[someString.index(someString.endIndex, offsetBy: -1)]

someString.insert("1", at: someString.endIndex)

var shoppingList = ["egg", "Milk",]
var shoppingCout = [1, 2, 3]
print(shoppingList)
print(shoppingCout)

shoppingList[0...1] = ["egg", "egg1", "egg2"]
shoppingList = []

var leters = Set<Character>()
leters.insert("a")
print(leters)
leters = []







