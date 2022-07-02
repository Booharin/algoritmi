//
//  File.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 02.07.2022.
//

import Darwin

final class Lesson3: LessonProtocol {
    func runAlgoritms() {
//        print(linearSearch(array: [1, 2, 3, 4, 5], value: 4))
//        print(bareerSearch(array: [1, 2, 3, 4, 5], value: 3))

        let size = 40
        var array1 = fillArray(length: size)
        let array2 = fillArray(length: size)
        //printArray(array: array1)

        //bubbleSort(array: &array1)
        //pickSort(array: &array1)
        
        var array3 = [3, 4, 8, 10, 45, 73, 3, 4, 7, 93, 25, 61, 33, 0, 7]
        printArray(array: array3)
        pickSort(array: &array3)
        printArray(array: array3)
        print(binSearch(array: &array3, value: 25))
    }

    func runHomeWork() {

    }
}

//MARK: - Home work

extension Lesson3 {
    // linear search
    func linearSearch(array: [Int], value: Int) -> Int {
        var i = 0
        while i < array.count && array[i] != value {
            i += 1
        }

        return i == array.count ? -1 : i
    }

    // bareer search
    func bareerSearch(array: [Int], value: Int) -> Int {
        var i = 0
        while array[i] != value {
            i += 1
        }

        return i
    }

    //MARK: - Sorting

    // bubble sort

    func bubbleSort(array: inout [Int]) {

        for i in 0...array.count {
            for j in 0...array.count - 1 {
                if j < array.count - 1, array[j] > array[j + 1] {
                    array.swapAt(j, j + 1)
                }
            }
        }

//        for i in (1..<array.count).reversed() {
//            for j in 0..<i where array[j] > array[j + 1] {
//                array.swapAt(j, j + 1)
//            }
//        }
    }

    func pickSort(array: inout [Int]) {
        var j = 0

        for i in 0...array.count {
            var jMin = i
            j = i

            for j in j...array.count {
                if  j < array.count,
                    jMin < array.count,
                    array[j] < array[jMin] {
                    jMin = j
                }
            }

            if  i < array.count,
                array[i] != array[jMin] {
                array.swapAt(i, jMin)
            }
        }
    }

    //MARK: - Binaric search

    func binSearch(array: inout [Int], value: Int) -> Int {
        var left = 0
        var right = array.count - 1

        var middle = left + (right - left) / 2

        while left <= right && array[middle] != value {
            if array[middle] < value {
                left = middle + 1
            } else {
                right = middle - 1
            }

            middle = left + (right - left) / 2
        }

        return array[middle] == value ? middle : -1
    }

    private func fillArray(length: Int) -> [Int] {
        var array = [Int]()

        for _ in 1...length {
            array.append(Int(arc4random() % 100)) //Int.random(in: 0..<100)
        }
        return array
    }

    private func printArray(array: [Int]) {
        for i in 0...array.count - 1 {
            print("\(array[i]) ", terminator: "")
        }
        print("\n")
    }

    private func swap(a: inout Int, b: inout Int) {
        a ^= b
        b ^= a
        a ^= b
    }

    // у нас есть просто swap если что
}
