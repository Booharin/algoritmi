//
//  File.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 26.06.2022.
//

final class Lesson2: LessonProtocol {
    var operations = 0

    func runAlgoritms() {
        cycle(numA: 0, numB: 8)
        print("\n")
        loop(numA: 0, numB: 8)

        print("factorial: ", fc(number: 5))

        print("factorial: ", f(n: 6))

        tower(size: 3)
    }

    func runHomeWork() {
        print(g1(number: 6))
        print("binary")
        dectoBinary(number: 110)
        print("\n")
        print(dectoBinaryString(number: 110, string: ""))
        print("\n")

        powerNumberWithotRecursion(number: 4, sign: 4)
        print("short")
        print(powerNumberWithRecursionShort(number: 4, sign: 4))
        print("\n")
        print("short with parity")
        print(powerNumberWithRecursionShortWithParity(number: 4, sign: 4))
        print("\n")
        print(powerNumberWithRecursion(number: 4, sign: 4))
        print(powerNumberWithRecursionWithParity(number: 4, sign: 4))
        print("\n")

        print(calc(from: 3, to: 20))
    }

    func cycle(numA: Int, numB: Int) {
        var a = numA

        while a < numB {
            print(a)
            a += 1
        }
    }

    func loop(numA: Int, numB: Int) {
        var a = numA
        a += 1

        print("eneterd: ", numA)

        if a < numB {
            loop(numA: a, numB: numB)
        }

        print("exited: ", numA)
    }

    func fc(number: Int) -> Int {
        var temp = number

        if temp == 0 {
            return 1
        }

        var result = 1

        while temp > 1 {
            temp -= 1
            result = temp
        }

        return result
    }

    // F(0) = 1
    // F(n) = F(n - 1) * n, if (n > 0)

    func f(n: Int) -> Int {
        if n == 0 {
            return 1
        } else {
            return f(n: n - 1) * n
        }
    }

    

    // Ханойская башня
    func tower(size: Int) {
        print("tower size: ", size)
        hanoi(from: 1, to: 3, amount: size)
        print("\n")
        print("count of operations: ", operations)
    }

    func put(from: Int, to: Int) {
        print("\(from) -> \(to) | ", terminator: "")
        operations += 1
        if operations % 5 == 0 {
            print("\n")
        }
    }

    func hanoi(from: Int, to: Int, amount: Int) {
        let temp = from ^ to
        if amount == 1 {
            put(from: from, to: to)
        } else {
            hanoi(from: from, to: temp, amount: amount - 1)
            put(from: from, to: to)
            hanoi(from: temp, to: to, amount: amount - 1)
        }
    }

    // ханойская башня всегда связана со степенью двойки
    // (2 ^ 10) - 1 = 1023
    // 10 - количество колец
}

//MARK: - Home work

extension Lesson2 {
    func f1(number: Int) -> Int {
        if number > 2 {
            return f1(number: number - 1) + g1(number: number - 2)
        } else {
            return number
        }
    }

    func g1(number: Int) -> Int {
        if number > 2 {
            return g1(number: number - 1) + f1(number: number - 2)
        } else {
            return 3 - number
        }
    }

//    func fromDecToBinary(number: Int) {
//        var v = 128
//        var n = number
//        for _ in 1...8 {
//            if n >= v {
//                print("1")
//                n -= v
//            } else {
//                print("0")
//                v /= 2
//            }
//            print("\n")
//        }
//    }

    func dectoBinary(number: Int) {
        if number > 1 {
            dectoBinary(number: number / 2)
            print(number % 2, terminator: "")
        } else {
            print(number, terminator: "")
        }
    }

    func dectoBinaryString(number: Int, string: String) -> String {
        print(number % 2)
        if number > 1 {
            return string + dectoBinaryString(number: number / 2, string: "\(number % 2)")
        } else {
            return "\(number % 2)"
        }
    }

    func powerNumberWithotRecursion(number: Int, sign: Int) {
        var n = number
        var s = sign

        while s != 1 {
            n *= number
            s -= 1
        }

        print(n)
    }

    func powerNumberWithRecursionShort(number: Int, sign: Int) -> Int {
        if sign == 0 {
            return 1
        } else {
            return number * powerNumberWithRecursionShort(number: number, sign: sign - 1)
        }
    }

    func powerNumberWithRecursionShortWithParity(number: Int, sign: Int) -> Int {
        if sign == 0 {
            return 1
        } else {
            if sign % 2 == 0 {
                return powerNumberWithRecursionShortWithParity(number: number * number, sign: sign / 2)
            } else {
                return number * powerNumberWithRecursionShortWithParity(number: number, sign: sign - 1)
            }
        }
    }

    func powerNumberWithRecursion(number: Int, sign: Int) -> Int {
        switch sign {
        case let x where x == 0:
            return 1
        case let x where x < 0:
            return 1 / (number * powerNumberWithRecursion(number: 1 / number, sign: sign + 1))
        default:
            return number * powerNumberWithRecursion(number: number, sign: sign - 1)
        }
    }

    // используя четность степени
    func powerNumberWithRecursionWithParity(number: Int, sign: Int) -> Int {
        switch sign {
        case let x where x == 0:
            return 1
        case let x where x < 0:
            return powerNumberWithRecursionWithParity(number: 1 / number, sign: -sign)
        case let x where x % 2 != 0:
            return number * powerNumberWithRecursionWithParity(number: number, sign: sign - 1)
        default:
            return powerNumberWithRecursionWithParity(number: number * number, sign:  sign / 2)
        }
    }

    func calc(from: Int, to: Int) -> Int {
        if from < to {
            return calc(from: from + 1, to: to) + calc(from: from * 2, to: to)
        } else if from == to {
            return 1
        } else {
            return 0
        }
    }
}
