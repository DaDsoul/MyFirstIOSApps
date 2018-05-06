//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var names: [String] = ["Sam","Tom","Jey"]
for (index,value) in names.enumerated() {
print (" player #\(index+1) is  \(value)")
}


var namez: Dictionary<Int,String> = [
    1:"Sam",
    2:"Tom",
    3:"Jey"
]
print ("namez contains \(namez.count) items")

if namez.isEmpty{print("Empt")
} else {
    print ("notEmpty")
}

let tuple = (13, "hello")
print(tuple.0)
print(tuple.1)


let name = "Tom"
var name1: String? = nil
print (name1 ?? name )


for i in 8..<10 {
print(i)
}


var list = [1,2,3,4]

list.remove(at: 2)
print(list)

var dict: [String:Int] = [
    "one" : 1
]
print (dict["one"])

var set: Set<Int> = []
set.insert(1)
set.insert(2)

set.contains(1)
print(set)






var opt: Int?=5

if let safevalue = opt {
print (safevalue)
}
else
{
print ("Error")
}


func SomeFunc(){
    var opti: Int?=nil
    guard let safeValue = opti else {
    print ("unsafe")
        return
    }
print("Safe")
}


var t=0
while t<10{
print(t)
    t+=1
}
let 😀 = "😀"
print (😀)

for i  in 10...15 {
print ("\(i) \n")
}

print ("Hello \n World")


var greeting = "Hello"
greeting.insert("!", at: greeting.index(greeting.startIndex, offsetBy: 3))
//greetimg.remove(at: greeting.index(greeting.endIndex, offsetBy: -3))
print (greeting)

















