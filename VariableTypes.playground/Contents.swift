import UIKit

let lightVelocityMetersPerSecond = 300_000 //it's a constant!
var myFirstVar = "It's a variable!"

print("----Int values:----\n")
print("Int8:")
print("min value = \(Int8.min)\nmax value = \(Int8.max)\n")

print("Int16:")
print("min value = \(Int16.min)\nmax value = \(Int16.max)\n")

print("Int32:")
print("min value = \(Int32.min)\nmax value = \(Int32.max)\n")

print("Int64 or default Int")
print("min value = \(Int64.min)\nmax value = \(Int64.max)\n")

print("UInt(unsigned int) values:\n")
print("UInt8:")
print("min value = \(UInt8.min)\nmax value = \(UInt8.max)\n")

print("UInt16:")
print("min value = \(UInt16.min)\nmax value = \(UInt16.max)\n")

print("UInt32:")
print("min value = \(UInt32.min)\nmax value = \(UInt32.max)\n")

print("UInt64:")
print("min value = \(UInt64.min)\nmax value = \(UInt64.max)\n")

print("----FLoating points:----\n")
var doubleValue: Double = 43.423_654_232_776_32
var floatValue: Float = 43.423_654_232_776_32

print("Double(64bits) = \(doubleValue), Float(32bits) = \(floatValue)\n")


print("----Booleans:----")
var myBool = true
print("my bool before toggle(): \(myBool)")

myBool.toggle()
print("my bool after toggle(): \(myBool)\n")

print("----Strings:----")
var myString = "this is a test String!"
let myLetString = "this is a let String. It can't be modified!"

var resultString = myString + myLetString //concatenacao

for char in myString {
    print(char)
}

//------------------------optionals------------------------
var myOptionalString: String?
myOptionalString = "It's a optional String type"

let secondOptionalString: Optional<String>
secondOptionalString = "Optional is a Enum"

var myNilString: String?

if let string = myNilString {
    print(string)
} else {
    print("It's nil!")
}

print(myOptionalString!)
//print(myNilString!) //-> result a error


var otherFormUnwrap = myNilString ?? "nil" // equivalent to: myNilString != nil ? myString! : "nil"

//---------------------------enums---------------------------
enum Planetas: Int {
    case mercurio = 0
    case venus
    case terra
}

var planeta1 = Planetas.terra
planeta1.rawValue

enum Produtos {
    case motog5(valorUnitario: Double, quantidade: Int, valorTotal: Double)
    case iphone12(Double, Int, Double)
    case ipad(Double, Int, Double)
}

var motog5 = Produtos.motog5(valorUnitario: 500.0, quantidade: 2, valorTotal: 1000.0)
print(motog5)

//-------------------------tuple-------------------------

typealias Person = (name: String, age: Int)
typealias Coordinate = (x: Double, y: Double)?
typealias Address = (local: String?, date: String?, time: String)

var partyAdress: Address = (local: "Rua x", date: nil, time: "13:30")
if let date = partyAdress.date {
    print(date)
} else {
    print("nil")
}

