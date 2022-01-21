import Foundation


public struct Output: Equatable {
    
    var first:Int
    var allPoints:Int
    
    public init(_ first:Int, _ allPoints: Int) {
        self.first = first
        self.allPoints = allPoints
    }
    
}


struct TestResult {
    
    public var correct:Int
    public var totalTests: Int
    
    public var grade: Double {
        
        get {
            return (Double(correct)/Double(totalTests)) * 10.0
        }
        
    }
    
}


public func == (lhs: Output, rhs: Output) -> Bool {
    
    return (lhs.allPoints == rhs.allPoints) && (lhs.first == rhs.first)
}


func != (lhs: Output?, rhs: Output?) -> Bool {
    
    return !(lhs == rhs)
    
}



struct TestCase {
    
    var matrix:[String]
    var expectedOutput: Output?
    
}


public protocol Testable {
    
    func execute(matrix:[String]) -> Output?
    
}


class Tester {
    
    
    let testCases:[TestCase] = [TestCase(matrix: ["🍞🍞👾🍞🍞🍞👾👾",
                                                  "🍞👾👾🍞🍞🍞🍞🍞",
                                                  "👾👾👾🍞🚩🍞🍞🚩",
                                                  "🍞👾🍞🍞🍞🍞🍞🍞",
                                                  "🍞👾🍞🍞🍞🍞🚩🍞",
                                                  "🍞🍞🍞🚩🍞🍞🍞🍞",
                                                  "🍞🍞🍞🍞🍞🍞🍞🍞"],
                                         expectedOutput: Output(3,5)),
                                
                                TestCase(matrix: ["🍞🍞👾🍞🍞🍞👾👾",
                                                  "🍞👾👾🍞🍞🍞🍞🍞",
                                                  "👾👾👾🍞🍞🍞🍞🍞",
                                                  "🍞👾🍞🍞🍞🍞🍞🍞",
                                                  "🍞👾🍞🍞🍞🍞🍞🍞"],
                                         expectedOutput: nil),
//
                                TestCase(matrix: ["🍞🍞🍞🍞🍞🚩🍞🍞",
                                                  "🍞🍞🍞🍞🚩🍞🍞🚩"],
                                             expectedOutput: nil),
                                
                                TestCase(matrix: ["🚩🍞🍞🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞👾🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞🚩"],
                                        expectedOutput: Output(5,8)),

                                TestCase(matrix: ["👾🍞🍞🚩",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞🍞",
                                                  "🍞🍞🍞👾"],
                                expectedOutput: Output(4,4))

                                ]
    
    
    
    public func test(target:Testable) -> TestResult {
        
        
        
        let score = testCases.reduce(0) { (currentValue, element) -> Int in
            
            let result = target.execute(matrix: element.matrix)
            
            return (result == element.expectedOutput) ? currentValue + 1 : currentValue

        }
        
        
        return TestResult(correct: score, totalTests: testCases.count)
        
    }

    
    public init() {
        
    }
    
}


public func test(_ target:Testable) {
    
    let tester = Tester()
    
    let result = tester.test(target:target)
    
    print("Você acertou \(result.correct) casos de um total de \(result.totalTests) ")

    
}






