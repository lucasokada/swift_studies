import UIKit

var greeting = "Hello, playground"

//Unitialized array---------------------------------------------------------------
let capacity = 20
let diceRolls = Array<Int>(unsafeUninitializedCapacity: capacity) {
    buffer, initializedCount in
    for x in 0 ..< capacity {
        buffer[x] = Int.random(in: 1...6)
    }
    
    initializedCount = capacity
}

/*2 forma. Menos eficiente que a primeira. A primeira forma é mais otimizada, contudo, essa segunda forma é mais limpa*/
let diceRolls2 = (0...20).map{ _ in Int.random(in: 1...6) }

// -------------------------------------------------------------------------------

//Changing funcionality-----------------------------------------------------------
/* mesmo closure que pode ser usado com mais de uma implementacao */
struct TestType {
    typealias GetNumClosure = ((Int, Int) -> Int) //define um tipo funcao
    
    var numOne = 5
    var numTwo = 8
    var results = 0
    
    mutating func getNum(handler: GetNumClosure) -> Int {
        results = handler(numOne, numTwo)
        print("Results: \(results)")
        return results
    }
}

var max: TestType.GetNumClosure = {
    if $0 > $1 {
        return $0
    }
    
    return $1
}

var min: TestType.GetNumClosure = {
    if $0 < $1 {
        return $0
    }
    
    return $1
}

var multiply: TestType.GetNumClosure = {
    return $0 * $1
}

var second: TestType.GetNumClosure = {
    return $1
}

var answer: TestType.GetNumClosure = {
    var _ = $0 + $1 // se faz isso pois sem essa linha o codigo fica invalido
    return 42
}

var myType = TestType()
myType.getNum(handler: max)
myType.getNum(handler: min)
myType.getNum(handler: multiply)
myType.getNum(handler: second)
myType.getNum(handler: answer)

// -------------------------------------------------------------------------------

//Select closure based on results-------------------------------------------------
class TestType2 {
    typealias ResultsClosure = ((String) -> Void)
    
    func isGreater(numOne: Int, numTwo: Int, successHandler: ResultsClosure, failureHandler: ResultsClosure) {
        if numOne > numTwo {
            successHandler("\(numOne) is greater than \(numTwo)")

        } else {
            failureHandler("\(numOne) is not greater than \(numTwo)")
        }
    }
}

var success: TestType2.ResultsClosure = {
    print("success: \($0)")
}

var failure: TestType2.ResultsClosure = {
    print("failure: \($0)")
}

var test = TestType2()
test.isGreater(numOne: 8, numTwo: 6, successHandler: success, failureHandler: failure)
