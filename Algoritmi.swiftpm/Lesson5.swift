//
//  Lesson5.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 06.07.2022.
//

import UIKit

final class Lesson5: LessonProtocol {
    func runAlgoritms() {

        //MARK: - List, push + pop

        let another = List<String>()
        another.size = 0
        push(list: another, value: "a")
        push(list: another, value: "b")
        push(list: another, value: "c")
        push(list: another, value: "d")
        push(list: another, value: "e")
        push(list: another, value: "f")

        while another.size > 0 {
            print(pop(list: another))
        }

        print("\n")
    }

    func runHomeWork() {
        let node = Node(payload: 0)
        let list = SinglyLinkedList(firstNode: node)

        var currentNode = node
        var nextNode: Node<Int>

        for i in 1..<10 {
            nextNode = Node(payload: i)
            currentNode.nextNode = nextNode
            currentNode = nextNode
        }

        list.printList()
        list.revererseRecursion()
        //list.reverse()
        print("\n")
        list.printList()
        print("\n")
        print("Braces")
        print("\n")

        // braces
        print(bracesCheck(text: ")"))
        print(bracesCheck(text: "{([{}[]()])}"))
        print(bracesCheck(text: "(2 + (2 * 2))"))

        print("\n")

        var listFrom = List<Int>()
        var listTo = List<Int>()

        for i in 0..<10 {
            push(list: listFrom, value: i)
        }

        printList(list: listFrom)
        copyList(from: listFrom, to: listTo)
        printList(list: listTo)
    }
}

extension Lesson5 {
    func bracesCheck(text: String) -> Int {
        var expression = text
        let typesCount = 3
        let braces: [[Character]] = [["(", ")"], ["[", "]"], ["{", "}"]]
        let list = List<Int>()

        for t in text {
            for i in 0..<typesCount {
                if t == braces[i][0] {
                    push(list: list, value: i)
                }
            }

            for i in 0..<typesCount {
                if t == braces[i][1] {
                    if list.size == 0 {
                        return 0
                    }
                    if i == list.head?.data {
                        popS(list: list)!
                    } else {
                        return list.size
                    }
                }
            }
        }

        return -1
    }

    func copyList<T>(from: List<T>, to: List<T>) {
        var tempList = List<T>()
        var currentNode = from.tail

        while currentNode != nil {
            push(list: to, value: currentNode?.data as! T)
            currentNode = currentNode?.prevNode
        }
    }
}

struct Stack<T: Comparable> {
    private var items: [T] = []
    private var maxLength: T
    private var ind = -1

    init(maxLength: T) {
        self.maxLength = maxLength
    }

    mutating func push(_ item: T) {
        if item < maxLength {
            items.append(item)
            ind += 1
        } else {
            print("Stack overflow")
        }
    }

    mutating func pop() -> T? {
        if ind != -1 {
            ind -= 1
            return items.removeLast()
        } else {
            print("Stack is empty")
            return nil
        }
    }
}

final class Node<T> {
    
    var payload: T
    var nextNode: Node?
    
    init(payload: T, nextNode: Node? = nil) {
        self.payload = payload
        self.nextNode = nextNode
    }
}

final class SinglyLinkedList<T> {
    
    var firstNode: Node<T>?
    
    init(firstNode: Node<T>? = nil) {
        self.firstNode = firstNode
    }

    func reverse() {
        var previous: Node<T>? = nil

        while firstNode != nil {
            let nextNode = firstNode?.nextNode
            firstNode?.nextNode = previous
            previous = firstNode
            firstNode = nextNode
        }

        firstNode = previous
    }

    func revererseRecursion() {
        func recurse(node: Node<T>?) -> Node<T>? {
            guard let node = node else { return nil }
            if node.nextNode == nil {
                return node
            }

            let reversed = recurse(node: node.nextNode)
            node.nextNode?.nextNode = node
            node.nextNode = nil

            return reversed
        }

        firstNode = recurse(node: firstNode)
    }

    func printList() {
        var node = firstNode

        while node != nil {
            print(node?.payload)
            node = node?.nextNode
        }
    }
}

final class NodeA<T> {
    
    var data: T
    var index: Int
    var nextNode: NodeA<T>?
    var prevNode: NodeA<T>?

    init(data: T, index: Int) {
        self.data = data
        self.index = index
    }
}

final class List<T> {
    var size = 0
    var head: NodeA<T>?
    var tail: NodeA<T>?
}

extension Lesson5 {
    //MARK: - PUSH

    func push<T>(list: List<T>, value: T) {
        let tmp: NodeA<T>? = NodeA(data: value, index: list.size)
        if tmp == nil {
            return
        }

        tmp?.nextNode = list.head
        tmp?.prevNode = nil
        
        if list.head != nil {
            list.head?.prevNode = tmp
        } else {
            list.tail = tmp
        }
        
        list.head = tmp
        list.size += 1
    }

    //MARK: - POP

    func pop<T>(list: List<T>) -> T? {
        if list.size <= 0 {
            return -1 as? T
        }

        var currentNode = list.head
        let result = list.head?.data
        list.head = list.head?.nextNode

        if list.size > 1 {
            list.head?.prevNode = nil
        } else {
            list.tail = nil
        }

        currentNode = nil
        list.size -= 1
        return result
    }

    //MARK: - POPS

    func popS<T>(list: List<T>) -> T? {
        if list.size <= 0 {
            print("Stack is empty")
            return -1 as? T
        }

        var tmp = list.head
        let value = list.head?.data

        list.head = list.head?.nextNode
        if list.size > 1 {
            list.head?.prevNode = nil
        } else {
            list.tail = nil
        }

        tmp = nil
        list.size -= 1
        return value
    }

    //MARK: - POPQ для очереди

    func popQ<T>(list: List<T>) -> T? {
        if list.size <= 0 {
            print("Stack is empty")
            return -1 as? T
        }

        var tmp = list.tail
        let value = list.tail?.data

        list.tail = list.tail?.prevNode
        if list.size > 1 {
            list.tail?.nextNode = nil
        } else {
            list.head = nil
        }

        tmp = nil
        list.size -= 1
        return value
    }

    //MARK: - PRINT

    func printList<T>(list: List<T>) {
        var currentNode = list.head
        while currentNode != nil {
            print("index: ", currentNode?.index ?? ""," data: ", currentNode?.data ?? "")
            currentNode = currentNode?.nextNode
        }

        print("\n")
    }
}


