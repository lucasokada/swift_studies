import Foundation

class Node<T: Comparable> {
    
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible { //permite que utilizemos nossa propria representacao para converter diferentes instancias para String
    
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

extension Node: Equatable {
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}

struct LinkedList<T: Comparable> {
    
    private var head: Node<T>?
    private var tail: Node<T>?
    
    init() {}
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    mutating func push(_ value: T) {
        let newNode = Node(value: value)
        
        if(head == nil) {
            head = newNode
            tail = head
            newNode.next = nil
        } else {
            newNode.next = head
            head = newNode
        }
        
    }
    
    mutating func append(_ value: T) {
        let newNode = Node(value: value)
        newNode.next = nil
        if head == nil {
            head = newNode
            tail = head
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    func findNode(at index: Int) -> Node<T>? {
        var count = 0
        var auxPointer = head
        
        while auxPointer != nil && count != index - 1 {
            auxPointer = auxPointer?.next
            count += 1
        }
        
    
        return auxPointer
    }
    
    mutating func insert(at index: Int, value: T) {
        
        let newNode = Node(value: value)
        
        if let auxPointer = findNode(at: index) {
            if index == 0 {
                newNode.next = head
                head = newNode
            }else {
                newNode.next = auxPointer.next
                auxPointer.next = newNode
            }
        }else{
            print("object not found!")
        }
        
    }
    
    mutating func pop() -> T? {
        let oldHead = head
        
        if !isEmpty() {
            head = head?.next
        }
        
        if head == nil {
            tail = nil
        }
        
        return oldHead?.value
    }
    
    mutating func removeLast() -> T?{
        var auxPointer = head
        
        if head != nil {
            if head == tail {
                head = nil
                return auxPointer?.value
            }
            
            while(auxPointer?.next != tail) {
                auxPointer = auxPointer?.next
            }
            
            tail = auxPointer
            auxPointer = tail?.next
            tail?.next = nil
            
            return auxPointer?.value
        }
        
        return nil
    }
    
    mutating func remove(at index: Int) -> T? {
        if index == 0 {
            let oldHead = head
            pop()
            
            return oldHead?.value
        }
        
        let node = findNode(at: index)
        
        if let node = node {
            let returnedNode = node.next
            node.next = node.next?.next
            
            return returnedNode?.value
        }
        
        return nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
}

//teste nodes
/*
let node1 = Node(value: 4)
let node2 = Node(value: 7)
let node3 = Node(value: 1)

print(node1.description)
print(node2.description)
print(node3.description)

node1.next = node2
node2.next = node3

print(node1.description)
print(node2.description)
print(node3.description)
*/

//teste list
var list = LinkedList<Int>()
list.push(5)
list.push(8)
list.append(34)
list.append(43)

print(list.description)

var element = list.removeLast()
element = list.removeLast()
element = list.remove(at: 0)

print(element ?? -1)
print(list.description)
