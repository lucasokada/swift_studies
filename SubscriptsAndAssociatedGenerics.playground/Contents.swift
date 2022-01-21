import UIKit

var greeting = "Hello, playground"

//subscripts

//Associated types
protocol QueueProtocol {
    associatedtype QueueType
    mutating func add(item: QueueType)
    mutating func getItem() -> QueueType?
    func count() -> Int
}

class IntQueue: QueueProtocol {
    var items = [Int]()
    
    func add(item: Int) {
        items.append(item)
    }
    
    func getItem() -> Int? {
        return items.count > 0 ? items.remove(at: 0) : nil
    }
    
    func count() -> Int {
        return items.count
    }
}
