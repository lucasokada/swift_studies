import UIKit

//                                  Closures
//format:
//(<parametros>) -> <tipo do retorno> in <statments>

let clos1 = {() -> Void in
    print("Hello World")
}

let clos2 = {(name: String) -> Void in
    print("Hello \(name)")
}

//passagem de closure como parametro
func testClosure(handler: (String) -> Void, name: String) {
    handler(name)
}

let clos3 = {(name: String) -> String in
    return "Hello \(name)"
}

clos1()

clos2("Lucas")

testClosure(handler: clos2, name: "Lucas Okada")

let greeting = clos3("Lucas")
print("\(greeting)")

//----------------------------------Forma mais Reduzida----------------------------------

//forma longa
func testFunction(num: Int, handler: () -> Void) { //funcao que recebe um closure como parametro
    for _ in 0 ..< num {
        handler()
    }
}

let clos = {() -> Void in
    print("Hello from standart syntax")
}

testFunction(num: 5, handler: clos)

//forma reduzida
testFunction(num: 5, handler: {print("Hello from Shorthand closure")})

//===========================================================================================

//forma longa
func testFunction2(num: Int, handler: (_ : String) -> Void) {
    for _ in 0 ..< num {
        handler("me")
    }
}

testFunction2(num: 5) {
    print("Hello from \($0)");
}

//---------------------------------------
let clos5: (String, String) -> Void = {
    print("\($0) \($1)")
}

clos5("Hello", "Lucas")

/*
let clos5b = { (String, String) -> Void in
    print("\($0) \($1)")                          ERRO
}
*/

//---------------------------------------
let clos6: () -> () = {
    print("teste")
}

clos6()
//---------------------------------------

let clos7 = {(first: Int, second: Int) -> Int in first + second} //nao precisa de keyword return
clos7(4, 7)
//---------------------------------------


// ------------CLOSURES IN ARRAYS-------------------

let guests = ["Jon", "Kailey", "Kara"]

guests.map { name in
    print("Hello \(name)")
}

guests.map { print("Hello \($0)") } //reduzido

var greetingMessages = guests.map {(name: String) -> String in
    return "Welcome \(name)"
}

for message in greetingMessages {
    print("\(message)")
}

let greetGuest = { (name: String) -> Void in
    print("Hello guest name \(name)")
}

let sayGoodBye = { (name: String) -> Void in
    print("Goodbye \(name)")
}

guests.map(greetGuest)
guests.map(sayGoodBye)

let greetGuest2 = {
    (name: String) -> Void in
    
    if name.hasPrefix("K") {
        print("\(name) is on the guest list")
    } else {
        print("\(name) was not invited")
    }
}

guests.map(greetGuest2)

func temperatures(calculate: (Int) -> Void) {
    let temperaturesArray = [56, 76, 32, 78, 45, 56]
    temperaturesArray.map(calculate)
}

func testFunc() {
    var total = 0
    var count = 0
    let addTemps = { (num: Int) -> Void in
        total += num
        count += 1
    }
    
    temperatures(calculate: addTemps)
    print("Total = \(total)")
    print("Count = \(count)")
    print("Average = \(total / count)")
}

testFunc()
