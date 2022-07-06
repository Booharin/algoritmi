//
//  Lesson4.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 04.07.2022.
//

import Darwin

private let X = 8
private let Y = 8

final class Lesson4: LessonProtocol {
    private let Queens = 8

    var board = [
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0]
    ]

    var boardWithLet = [
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 0, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1, 1, 1]
    ]
    
    func runAlgoritms() {

        annul()
        queens(n: 1)
        printBoard()

        //        let rows = 5
        //        let columns = 5
        //
        //        for i in 0..<rows {
        //            for j in 0..<columns {
        //                //print(String(format: "%5d", findRotes(x: i, y: j)))
        //                print("\(findRotes(x: i, y: j)) ", terminator: "")
        //            }
        //            print("\n")
        //        }

                print(
                    LCS(
                        arr1: ["a", "b", "c", "d", "e", "f", "g"],
                        arr2: ["q", "w", "e", "a", "s", "c", "f", "g", "h"]
                    )
                )
    }

    // количество маршрутов короля на шахматной доске
    func findRotes(x: Int, y: Int) -> Int {
        if x == 0 && y == 0 {
            return 0
        } else if x == 0 || y == 0 {
            return 1
        } else {
            return findRotes(x: x, y: y - 1) + findRotes(x: x - 1, y: y)
        }
    }

    var path =  Set<String>()

    func LCS(arr1: [String], arr2: [String]) -> Int {
        guard arr1.count > 0 && arr2.count > 0 else {
            return 0
        }

        var l1 = arr1, l2 = arr2

        if l1.last == l2.last {
            path.insert(l1.removeLast())
            l2.removeLast()
            return 1 + LCS(arr1: l1, arr2: l2)
        }
        else {
            var l11 = l1
            l11.removeLast()
            var l22 = l2
            l22.removeLast()
            return max(LCS(arr1: l1, arr2: l22), LCS(arr1: l11, arr2: l2))
        }
    }

    func annul() {
        for i in 0..<Y {
            for j in 0..<X {
                board[i][j] = 0
            }
        }
    }

    func printBoard() {
        for i in 0..<Y {
            for j in 0..<X {
                print(board[i][j], terminator: "")
            }
            print("\n")
        }
    }

    func checkQueen(x: Int, y: Int) -> Int {
        for i in 0..<Y {
            for j in 0..<X {
                if board[i][j] != 0 {
                    if !(i == x && j == y) {
                        if i - x == 0 || j - y == 0 {
                            return 0
                        }
                        if abs(i - x) == abs(j - y) {
                            return 0
                        }
                    }
                }
            }
            print("\n")
        }

        return 1
    }

    func checkBoard() -> Int {
        for i in 0..<Y {
            for j in 0..<X {
                if board[i][j] != 0 {
                    if checkQueen(x: i, y: j) == 0 {
                        return 0
                    }
                }
            }
        }

        return 1
    }

    func queens(n: Int) -> Int {
        if checkBoard() == 0 {
            return 0
        }
        if n == Queens + 1 {
            return 1
        }

        for i in 0..<Y {
            for j in 0..<X {
                if board[i][j] == 0 {
                    board[i][j] = n
                    if queens(n: n + 1) == 1 {
                        return 1
                    }
                    board[i][j] = n
                }
            }
        }

        return 0
    }

    func runHomeWork() {
        
    }
}

//MARK: - Home work

extension Lesson4 {
    func findRoutesWithLet(r: Int, c: Int, array: [[Int]]) -> Int {
        if r == 0 || c == 0 {
            return 1
        } else {
            return array[r][c] == 1 ?
            findRoutesWithLet(r: r - 1, c: c, array: array) + findRoutesWithLet(r: r, c: c - 1, array: array) : 0
        }
    }
}
