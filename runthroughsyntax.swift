/*

a guide for self, feel free to take a look! 
If you are new to Swift this might help a bit!
covers most basic syntax from var to class 

*/


import UIKit

var str = "Hello, playground"

print ("Hello, world")

2+6
var a = 5+5
print(a+1);

                    //this is a comment

/* woooot
    this is still a comment
            woot */

/* can we do a nested commment???
                /*Hell yeah!*/
                        we can */

var b : Int = 7
print(b)
b = 5
print(b)


let distanceToMoon = 384_000
let earthGravAcc = 9.8

var total:Int = 100
var Velocity:Double = 0.5  //actually you can not declare without init value

let result = "\(a) times \(b) is \(a*b)" //much more efficient than " " + " " concat
print(result)

/*
    while loop
    repeat-while
    for-in loop, aka for-each loop
    switch statement
 */

if a != 0 {
    print("\(a)/\(b) is \(a/b)")
} else {
    print("mehhh")
}


//for loop examples

let N = 100
var sum = 0
for i in 1...N{
    sum+=i
}
print(sum)

var power2 = 1
for _ in 1 ... 10 {
    power2 *= 2
}
print(power2)

//prints to 9
for i in 0 ..< 10 {
    print(i)
}

//prints from 10 to 1
for i in (1 ... 10).reversed(){
    print(i)
}

//Arrays are like List in Java
//simple linear search n^2 time
let cities = ["berlin","london","chicago","tokyo"]
let searches = ["berlin","tokyo"]

for city in searches{
    var found = false
    for c in cities{
        if c == city{
            found = true
            break //breaks immediate enclosing loop
        }
    }
    print(city, "is", found ? "found" : "not found")
}

//functions

func helloWorld(){
    print("Hello, world")
}
helloWorld()
//Arguments have to be named!!!!!
func greet(name: String){
    print("Hello, \(name)!")
}
//Must include the named in
greet(name: "Mike")
greet(name: "Swift")

func plus (a : Int, b : Int){
    print("\(a) + \(b)  =  \(a+b)")
}
plus(a:1, b:2)

//Unnamed arguements can be used if anonymous parameters were used when creating function
func pluss(_ a : Int, _ b : Int){
    print("\(a) + \(b)  =  \(a+b)")
}
pluss(a,b)

//Return value type, scala style
func square(_ n : Int) -> Int{
    print("\(n) square = \(n*n)")
    return n*n
}
square(2)

func max(_ x : Int , _ y : Int) -> Int {
    print("max of \(x) and \(y) is \(x >= y ? x : y)")
    return x >= y ? x : y
}
max(3,8)

//Identifires can have 2 names external and internal to help make more readable
//external name of "of" and "and"
func maxx(of x : Int , and y : Int) -> Int {
    print("max of \(x) and \(y) is \(x >= y ? x : y)")
    return x >= y ? x : y
}
maxx(of: 4, and: 7)

//external names can be repeated, purely for improving readablitiy
//useful application here
func printTicket(Depart d : String, Arrive a : String, Transfer t : String, Transfer tt : String ){
    print("Depart from \(d), transfer at \(t), then transfer at \(tt), finally arrive at \(a), Purdue")
}
printTicket(Depart : "Taipei", Arrive : "West Lafayette", Transfer : "Tokyo", Transfer : "Detroit")

//class follow Java, no headers etc
class Counter{             //class
    var count = 0
    func increment(){      //method
        count += 1
    }
    func decrement(){
        count -= 1
    }
    func increment(by n : Int){
        count += n
    }
    func decrement(by n : Int){
        count -= n
    }
}
//Java creating a class intance class a = new class(); no need for Swift, just
var c1 = Counter()
c1.count = 1        //direct access to properties, no gets
c1.increment()      //and methods
c1.increment(by: 5)
c1.decrement(by: 100)
print(c1.count)

//constructors uses a init function, self = this
class Fraction {
    var nume : Int = 1
    var denom : Int = 1
    //3 initializing choices :
    init(){} //option to leave emtpy
    init(nume : Int, denom : Int){
        self.nume = nume
        self.denom = denom
    }
    init(_ nume: Int, over denom: Int){
        self.nume = nume
        self.denom = denom
    }
    func printFrac(){
        print("\(nume)/\(denom)")
    }
    func toDouble() -> Double {
        print(Double(nume)/Double(denom))
        return Double(nume)/Double(denom)
    }
    func add(_ f: Fraction) -> Fraction{
        var result: Fraction = Fraction()
        result.nume = nume * f.denom + denom * f.nume
        result.denom = denom * f.denom
        return result
    }
    static func +(a: Fraction, b : Fraction) -> Fraction{
        return a.add(b)
    }
}
var f1 = Fraction(nume : 1, denom : 1)
f1.printFrac()
f1.nume = 3
f1.denom = 2
f1.printFrac()
f1.toDouble()

var f2 = Fraction()


