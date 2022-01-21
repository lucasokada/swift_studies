import UIKit

var str = "Hello, playground" //this is a normal variable. "var"
let constant = 5.66 //this is a constant. "let". Its value can't be changed after it's set

var integer = 3, double = 5.65, bool = true

print("Hello World");

var message : String //type annotation. Clear the type of the values that the variable can stores
var itsTrue : Bool = true

//Swift is a static language. Because of that, it can't be done.
//var teste = "String"
//print(teste)
//teste = 5.6
//print(teste)

//Integers - are all numbers without the fractional component. it can be signed or unsigned
//UInt8 - unsigned ints with 8 bits
//Int32 - signed ints with 32 bits

/*
Floats - numbers with fractional components
 */

//*Numeric Literals
let intNumber = 5
let binary = 0b01101 //use 0b prefix
let octal = 0o43 //use 0o prefix
let hexadecimal = 0x11 //use 0x prefix
let scientificNotation = 1.2e4 //1.2 x 10 e 4

//*cast
let three = 3
let fractional = 0.1415
let pi = Double(three) + fractional
print(pi)

//*Tuples:
// group multiple variables into a single compound value
let http404Error = (404, "Not Found") //http error message is a tuple, composed by a integer and a string
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
var errorCode = http404Error.0
var messageError = http404Error.1

//Tuples are particularly useful as the return values of functions.

//*Optionals
//used in situations that the value may be absent(ausente).
//there are two possibities: either exist a value

//ex: convert a string value to a int value. But not every string can be converted to int. so
var string = "asd"
let possibleNumber  = Int(string)

//Optional binding

//if let
if let actualNumber = Int(string) {
    print("the \" \(actualNumber)\" is a number"); //that indicates that the variable contains a valur\e
}else{
    print("its not a number")
}

//guard
func guardTest(string : String) {
    guard let acnumber = Int(string) else {
        print(" here .its not a number")
        return
    }
}
