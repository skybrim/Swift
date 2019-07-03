import UIKit


//索引
//使用 startIndex 属性可以获取一个 String 的第一个 Character 的索引。
//使用 endIndex 属性可以获取最后一个 Character 的后一个位置的索引
//endIndex 属性不能作为一个字符串的有效下标，直接使用 endIndex 会报错
//如果 String 是空串，startIndex 和 endIndex 是相等的。
let str1 = "Hello"
print(str1[str1.startIndex]) //H
print(str1[str1.index(before: str1.endIndex)]) //o
print(str1[str1.index(after: str1.startIndex)]) //e
print(str1[str1.index(str1.startIndex, offsetBy: 1)]) //e
print(str1[str1.index(str1.endIndex, offsetBy: -1)]) //o
//使用 indices 属性会创建一个包含全部索引的 Range
for index in str1.indices {
    print("\(str1[index]) ", terminator: "") //H e l l o
}

print("\n")

//插入
var str2 = "Hello"
str2.insert("!", at: str2.endIndex)
print(str2) //Hello!
str2.insert(contentsOf:" world", at: str2.index(before: str2.endIndex))
print(str2) //Hello world!

//删除
var str3 = "Hello, world!"
str3.remove(at: str3.index(before: str3.endIndex))
print(str3) //Hello world
let range = str3.index(str3.endIndex, offsetBy: -6)..<str3.endIndex
str3.removeSubrange(range)
print(str3) //Hello

//substring
//需要把结果转化为 String 以便长期存储
let str4 = "Hello, world!"
let index = str4.firstIndex(of: ",") ?? str4.endIndex
//beginning 是 substring
let substring1 = str4[..<index]
print(substring1) //Hello
let substring2 = str4.prefix(5)
print(substring2) //Hello
let substring3 = str4.suffix(6)
print(substring3) //world!


//遍历
let str5 = "Hello, world!"
//遍历出来的 Character
for character in str5 {
    print("\(character) ", terminator: "") //H e l l o ,   w o r l d !
}
print("")
//遍历出来的 String.Index
for index in str5.indices {
    print("\(str5[index]) ", terminator: "") //H e l l o ,   w o r l d !
}

//根据内容找索引
let str6 = "Hello, world!"
//从前往后数
if let index = str6.firstIndex(of: ",") {
    print(str6[index])
}
//从后往前数
if let index = str6.lastIndex(of: ",") {
    print(str6[index])
}

//把 string 转为数组
let str7 = "Hello, world!"
let stringArray = str7.map{ String($0) }
print(stringArray) //["H", "e", "l", "l", "o", ",", " ", "w", "o", "r", "l", "d", "!"]

//其他
let strLast = "Hello, world!"
//判断前后缀
if strLast.hasPrefix("Hello") {
    print("strLast has prefix hello")
}
if strLast.hasSuffix("world!") {
    print("strLast has suffix world!")
}
//反转字符串
print(String(strLast.reversed())) //!dlrow ,olleH
//[Character] 转 String
let chars: [Character] = ["H", "e", "l", "l", "o"]
print(String(chars))
