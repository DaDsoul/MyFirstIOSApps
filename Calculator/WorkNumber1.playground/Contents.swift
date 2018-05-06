//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



class Animals {
    var name:String?
    var species:String?
    var canFly: Bool=false
    var weight : Float = 0.0
    
    init(){
        
    }
    
    init(species:String, weight: Float ){
        self.species = species
        self.weight = weight
    }
    
    func makeNoise() {
    print ("Brbrbr")
    }
    
}

let c = Animals()
c.makeNoise()

let cat = Animals(species: "Cat", weight: 1.2)
print (cat.weight)




var List: Set = ["Tom","Sam"]
if let removedName = List.remove("Mike") {
print ("Now, no any Mike")
}
else
{
print ("Before this, no any Mike \\ \n OK ")
}
List.insert("Sasha")
print ("the number of names is \(List.count)")

var greeting = "Hello"
let symbol = greeting[greeting.index(before: greeting.endIndex)]
print (symbol)
let Symbol = greeting[greeting.index(greeting.startIndex, offsetBy: 3)]
print (Symbol)
greeting.insert("?", at: greeting.endIndex)
print (greeting)



    
/*for index in greeting.indices{
    print ("\(greeting[index])",terminator: "")
}*/
//greeting.insert(contentsOf: " Evereybody", at: greeting.index(before: greeting.endIndex))


class List_of_Planets {
    var name:String!
    var description:String!
    init(){}
    init(name:String,description:String){
        self.name = name
        self.description = description
    }
}

let Uran = List_of_Planets(name:"Uran",description:"Freeze")

let Mars = List_of_Planets(name:"Mars",description:"Red")

let Earth = List_of_Planets(name:"Earth",description:"Home")

let Venus = List_of_Planets(name:"Venus",description:"Blue")


let Planets: [List_of_Planets] =
    [
        Uran,
        Mars,
        Venus,
        Earth
]
let AnyNumber=Int(arc4random_uniform(3))
print (Planets[0].name)
print (Planets[AnyNumber].name)

//var RandomPlanet = String(arc4random_uniform(9))

//print (RandomPlanet)

let good=true
let oneSide=50
let anotherSide = oneSide + (good ? oneSide : 20)
print (anotherSide)

var a: String?
let b: String = "Meduza"
var k = a ?? b
print (k)

let somewords: [Character] = ["c","r","f"]
let somewordsString = String (somewords)
print (somewordsString)






