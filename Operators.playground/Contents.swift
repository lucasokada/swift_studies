import UIKit

let exempleNumber = 36
print("little endian of \(exempleNumber) = \(exempleNumber.littleEndian)")
print("big endian of \(exempleNumber) = \(exempleNumber.bigEndian)")

//bitwise
let exempleNegativeNumber = -54
let exemplePositiveNumber = 54
print(String(exempleNegativeNumber, radix: 2))
print(String(exemplePositiveNumber, radix: 2))
print(String(255, radix: 2))
    //Apenas distincao por sinal
    //Nao considera zeros

let andResult = exempleNumber & 0b1111
let orResult = exempleNumber | 0b1111
let xorResult = exempleNumber ^ 0b1111
let notResult = ~exempleNumber
let leftShift = exempleNumber << 1 // mul 2
let rightShift = exempleNumber >> 1 // div 2

//operadores de overflow
//let intOverflow: UInt8 = UInt8.max + 1 //lança erro
let sumOverflow: UInt8 = UInt8.max &+ 3
print("sum = " + String(sumOverflow, radix: 2))
let subOverflow: UInt8 = UInt8.min &- 2
print("sub = " + String(subOverflow, radix: 2))
let mulOverflow: UInt8 = UInt8.max &* 5
print("mul = " + String(mulOverflow, radix: 2))

//----------------------------------------------------------------------------------------------------

//metodos operadores

struct MyPoint {
    var x: Int
    var y: Int
}

extension MyPoint {
    static func +(left: MyPoint, right: MyPoint) -> MyPoint {
        return MyPoint(x: left.x + left.y, y: left.y + right.y)
    }
    
    static func +=(left: inout MyPoint, right: MyPoint) {
        left.x += right.x
        left.y += right.y
    }
    
    static prefix func -(point: MyPoint) -> MyPoint {
        return MyPoint(x: -point.x, y: -point.y)
    }
}

var pointOne = MyPoint(x: 5, y: 3)
var pointTwo = MyPoint(x: 2, y: 9)

var pointSum = pointOne + pointTwo
pointTwo += pointSum
let inverse = -pointSum
