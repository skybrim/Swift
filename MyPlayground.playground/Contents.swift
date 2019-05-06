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

//var itemSet = Set<Any>()
//print(itemSet)
var itemArray: Array<Any> = ["Any",123,"123"]
print(itemArray)

var airports = ["YTZ":"Toronto Pearson", "DUB":"Dublin",]


let base = 3
let power = 3
var answer = 1
for _ in 1..<power {
    answer *= base
}
print(answer)

let minuteInterval = 5
for tickMark in stride(from: 0, through: 60, by: 5) {
    print(tickMark)
}

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput += String(character)
    }
}
print(puzzleOutput)

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [1]) {
    print(bounds.min, bounds.max)
}

func swapTwoInts(a: inout Int, b: inout Int) {
    let tmpA = a
    a = b
    b = tmpA
}
var qqq = 10
var www = 15
swapTwoInts(a: &qqq, b: &www)
print(qqq, www)

func addTwoInts(_ a: Int, _ b: Int) -> Int{
    
    return a + b
}

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 1, 2)

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella",]

var reversedNames: [String]
reversedNames = names.sorted(by: >)
print(reversedNames)

let digitNames = [
    0:"Zero", 1:"One", 2:"Two", 3:"Three", 4:"Four",
    5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine",
]

let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number = number / 10
    }while number > 0
    return output
}
print(strings)


var completionHandlers: [() -> Void] = []

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(five, four)

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(five))
print(evaluate(ArithmeticExpression.addition(ArithmeticExpression.number(4), ArithmeticExpression.number(4))))
print(evaluate(ArithmeticExpression.multiplication(ArithmeticExpression.number(4), ArithmeticExpression.number(4))))

struct Resolution {
    var width = 0
    var height = 0
    var vi = VideoMode()
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
