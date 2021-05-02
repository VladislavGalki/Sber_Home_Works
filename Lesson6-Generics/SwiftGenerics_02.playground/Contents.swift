import Foundation

protocol Container {
    associatedtype Item
    mutating func append (_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item? { get }
}

//Queue

struct Queue<T> {
    
    private var items: [T] = []
    
    mutating func enqueue (_ value: T) {
        items.append(value)
    }
    
    mutating func dequeue () -> T? {
        guard !items.isEmpty else { return nil }
        
        return items.removeFirst()
    }
    
    var head: T? {
        return items.first
    }
    
    var tail: T? {
        return items.last
    }
}


extension Queue: Container {
    mutating func append(_ item: T) {
        self.enqueue(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> T? {
        return items[i]
    }
}

//LinkedList

class Node<T> {
    
    let value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    
    let head: Node<T>
    var count = 0
    
    init(node: Node<T>) {
        self.head = node
        count = 1
    }
    
    convenience init(nodeValue: T) {
        self.init(node: Node<T>(value: nodeValue))
    }
    
    func addNode(node: Node<T>) {
        var current: Node = self.head
        while current.next != nil {
            current = current.next!
        }
        current.next = node
        count += 1
    }
    
    func addNode(withValue value: T) {
        self.addNode(node: Node(value: value))
    }
}

extension LinkedList: Container {

    typealias Item = T
    
    func append(_ item: T) {
        self.addNode(withValue: item)
    }
    
    subscript(index: Int) -> T? {
        let current: Node = self.head
        let counter = 0
        var result: T? = nil
        
        while counter != index + 1 {
            if counter == index {
                result = current.value
            } else {
                return nil
            }
        }
        return result
    }
}
