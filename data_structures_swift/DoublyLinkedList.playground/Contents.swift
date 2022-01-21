import UIKit

class Node<T: Comparable> {
    var element: T
    var next: Node<T>?
    var previous: Node<T>?
    
    init(element: T, next: Node<T>? = nil, previous: Node<T>? = nil) {
        self.element = element
        self.next = next
        self.previous = previous
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(element)"
        }
        return "\(element)<->" + String(describing: next) + " "
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element == rhs.element
    }
}

struct DoublyList<T: Comparable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    init(head: Node<T>? = nil, tail: Node<T>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    func isEmpty() -> Bool {
        let empty = head == nil ? true : false
        return empty
    }
    
    mutating func push(_ element: T) {
        let newNode: Node<T>? = Node(element: element)
        
        if isEmpty() {
            head = newNode
            tail = head
            
            newNode?.next = nil
            newNode?.previous = nil
        } else {
            newNode?.next = head
            newNode?.previous = nil
            
            head = newNode
        }
    }
    
    mutating func append(_ element: T) {
        let newNode = Node(element: element)
        
        if isEmpty() {
            head = newNode
            tail = head
            
            newNode.next = nil
            newNode.previous = nil
        } else {
            tail?.next = newNode
            newNode.next = nil
            newNode.previous = tail
            
            tail = newNode
        }
    }
    
    func findPreviousNode(at index: Int) -> Node<T>? {
        if isEmpty() {
            return nil
        } else {
            var count = 0
            var auxPointer = head
            
            while auxPointer != nil && count < index - 1 {
                auxPointer = auxPointer?.next
                count += 1
            }
            
            return auxPointer
        }
    }
    
    mutating func insert(_ element: T, at index: Int) {
        if index == 0 {
            push(element)
        } else {
            let newNode = Node(element: element)
            let auxNode = findPreviousNode(at: index)
            
            newNode.next = auxNode?.next
            newNode.previous = auxNode
            auxNode?.next?.previous = newNode
            auxNode?.next = newNode
            
            if newNode.next == nil {
                tail = newNode
            }
        }
    }
    
    mutating func pop() {
        if isEmpty() {
            print("The list is empty!")
        } else {
            head = head?.next
            head?.previous = nil
        }
    }
    
    mutating func remove() {
        if isEmpty() {
            print("The list is empty!")
        } else {
            tail = tail?.previous
            tail?.next = nil
        }
    }
    
    mutating func remove(at index: Int) {
        if index == 0 {
            pop()
        } else {
            let node = findPreviousNode(at: index)
            node?.next  = node?.next?.next
            node?.next?.next?.previous = node
            
            if node?.next == nil {
                tail = node
            }
        }
    }
}

extension DoublyList: CustomStringConvertible{
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
}

var doublyList = DoublyList<Int>()
doublyList.push(6)
doublyList.push(2)
doublyList.push(8)
doublyList.push(10)
doublyList.append(50)
doublyList.append(20)
doublyList.append(10)
doublyList.insert(-4, at: 3)
doublyList.insert(0, at: 0)
doublyList.insert(1000, at: 9)

print(doublyList.description)

doublyList.pop()
doublyList.remove()

print(doublyList.description)

doublyList.remove(at: 0)
doublyList.remove(at: 4)

print(doublyList.description)

doublyList.remove(at: 5)

print(doublyList.description)
print("\(doublyList.tail?.element ?? -1)")

