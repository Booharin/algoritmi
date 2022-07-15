//
//  File.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 12.07.2022.
//

final class Lesson7: LessonProtocol {
    let size = 10
    let matrix = [
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ]

    func runAlgoritms() {

    }

    func runHomeWork() {

    }

    // обход графа в ширину
    func widthTravers<T>(start: GraphNode<T>, stop: GraphNode<T>) -> Int {
        let q = GraphQueue<T>()
        pushQ(q, start)
        start.used = 1

        while q.size != 0 {
            let currentNode: GraphNode<T>? = popQ(queue: q)
            if currentNode?.index == stop.index {
                return 1
            }

            while currentNode?.children?.head?.next != nil {
                let child = currentNode?.children?.head
                if child?.used == 0,
                    let child = child {
                    pushQ(q, child)
                    child.used = 1
                }
            }
        }

        return 0
    }
}

extension Lesson7 {
    //MARK: - PUSH
    
    func pushQ<T>(_ queue: GraphQueue<T>,_ value: GraphNode<T>) {

        value.next = queue.head
        value.prev = nil
        
        if queue.head != nil {
            queue.head?.prev = value
        } else {
            queue.tail = value
        }
        
        queue.head = value
        queue.size += 1
    }

    func popQ<T>(queue: GraphQueue<T>) -> GraphNode<T>? {
        if queue.size <= 0 {
            print("Stack is empty")
            return nil
        }

        let tmp = queue.tail
        //let value = queue.tail?.data

        queue.tail = queue.tail?.prev
        if queue.size > 1 {
            queue.tail?.next = nil
        } else {
            queue.head = nil
        }

        queue.size -= 1
        return tmp
    }
}

final class GraphNode<T> {
    let data: T?
    var used = 0
    let index: Int

    var children: GraphStack<T>?

    var prev: GraphNode?
    var next: GraphNode?

    init(index: Int, data: T? = nil) {
        self.index = index
        self.data = data
    }
}

final class GraphStack<T> {
    var size = 0
    var head: GraphNode<T>?
}

final class GraphQueue<T> {
    var size = 0
    var head: GraphNode<T>?
    var tail: GraphNode<T>?
}
