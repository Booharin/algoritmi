//
//  File.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 26.06.2022.
//

final class Lesson1: LessonProtocol {

    func runAlgoritms() {
        
        print(greatestIntEvclid(numA: 1, numB: 4))
        print(evclidWithDevision(numA: 74, numB: 12))
        print(averageGrade([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
        print(averageGradeWithBool([1, 2, 3, 4, 5, 6, -1, 8, 9, 10]))
        print(reverseInt(numBer: 1234))
        print(power(base: 9, sign: 10))
    }

    func runHomeWork() {
        print(getWeightHeightIndex(height: 1.86, weight: 117))
        print("поменять местами значения")
        print(changeNumbers(numA: 3, numB: 7))
        
        findQuadraticRoots(numA: -1, numB: -2, numC: 15)
        
        getSeason(witn: 3)
        getCorrectAge(for: 21)
        checkIsOneColor(x1: 2, y1: 2, x2: 4, y2: 4)
        getQuotientAndRemainderWithoutDevideing(numA: 21, numB: 5)
        checkIsNumberHasOdd(number: 2232242)
        
        getAutomorphicNumbers(for: 76)
    }

    //MARK: - Алгоритм Эвклида эффективный алгоритм для нахождения наибольшего общего делителя

    func greatestIntEvclid(numA: Int, numB: Int) -> Int {
        var a = numA
        var b = numB

        while a != b {
            if a > b {
                a = a - b
            } else {
                b = b - a
            }
        }
        return a
    }

    //MARK: - Алгоритм Эвклида с делением

    func evclidWithDevision(numA: Int, numB: Int) -> Int {
        var a = numA
        var b = numB

        while b != 0 {
            let c = a % b
            a = b
            b = c
        }
        return a
    }

    //MARK: - Среднее значение

    func averageGrade(_ grades: [Int]) -> Double {
        var sum = 0
        grades.forEach {
            sum += $0
        }

        let average = Double(sum) / Double(grades.count)
        return average
    }

    func averageGradeWithBool(_ grades: [Int]) -> Double {
        var sum = 0
        for (index, value) in grades.enumerated() {
            if value == -1 {
                let average = index > 0 ? Double(sum) / Double(index) : 0
                return average
            } else {
                sum += value
            }
        }
        let average = Double(sum / grades.count)
        return average
    }

    //MARK: - Переворот числа

    func reverseInt(numBer: Int) -> Int {
        var originNumBer = numBer
        var tempNumber = 0

        while originNumBer != 0 {
            tempNumber = tempNumber * 10 + originNumBer % 10
            originNumBer /= 10
        }

        return tempNumber
    }

    //MARK: - Функция ускоренного возведения в степень

    func power(base: Int, sign: Int) -> Int {
        var result = 1
        var baseNumber = base
        var signNumber = sign

        while signNumber != 0 {
            if signNumber % 2 == 0 {
                baseNumber *= baseNumber
                signNumber /= 2
            } else {
                result *= baseNumber
                signNumber -= 1
            }
        }

        return result
    }
}

//MARK: - Home work

extension Lesson1 {
    func getWeightHeightIndex(height: Double, weight: Double) -> Double {
        let index = weight / (height * height)
        return index
    }

    func changeNumbers(numA: Int, numB: Int) -> (Int, Int) {
        var a = numA
        var b = numB
// var 1
//        a = b + a
//        b = a - b
//        a = a - b
// var 2
        print(numA)
        print(numB)
        swap(&a, &b)

        return (a, b)
    }

    func findQuadraticRoots(numA: Double, numB: Double, numC: Double) {
        let discriminant = numB * numB - 4 * numA * numC

        if numA == 0 {
            let x1 = -numC / numB
            print("корень квадратного уровнения \(x1)")
        } else {
            switch discriminant {
            case let x where x == 0:
                let x1 = ((-numB) + discriminant.squareRoot()) / 2 * numA
                print("корень квадратного уровнения \(x1)")
            case let x where x > 0:
                let x1 = ((-numB) + discriminant.squareRoot()) / 2 * numA
                let x2 = ((-numB) - discriminant.squareRoot()) / 2 * numA
                
                print("корни квадратного уровнения \(x1) \(x2)")
            default:
                print("количество корней равно 0")
            }
        }
    }

    func getSeason(witn month: Int) {
        let count = month % 6
        if month < 6 || month == 12 {
            if count < 3 {
                print("зима")
            } else {
                print("весна")
            }
        } else {
            if count < 3 {
                print("лето")
            } else {
                print("осень")
            }
        }
    }

    func getCorrectAge(for years: Int) {
        let handredCount = years % 100
        let tenCount = years % 10

        //var 1
//        switch tenCount {
//        case 0:
//            print("\(years) лет")
//        case 1:
//            if handredCount < 21 {
//                print("\(years) лет")
//            } else {
//                print("\(years) год")
//            }
//        case let x where x < 5:
//            if handredCount < 21 {
//                print("\(years) лет")
//            } else {
//                print("\(years) года")
//            }
//        default:
//            print("\(years) лет")
//        }

        //var 2
        if tenCount == 1 && (handredCount != 11) {
            return print("\(years) год")
        } else if tenCount >= 2 && tenCount < 5 && !(handredCount >= 12 && handredCount < 15) {
            print("\(years) года")
        } else {
            print("\(years) лет")
        }
    }

    func checkIsOneColor(x1: Int, y1: Int, x2: Int, y2: Int) {
        // var 1
//        if x1 % 2 == y1 % 2 && x2 % 2 == y2 % 2 {
//            print("цвет одинаковый")
//        } else if x1 % 2 != y1 % 2 && x2 % 2 != y2 % 2 {
//            print("цвет одинаковый")
//        } else {
//            print("цвет разный")
//        }
        //var 2
        if (x1 + y1) % 2 == (x2 + y2) % 2 {
            print("цвет одинаковый")
        } else {
            print("цвет разный")
        }
    }

    func getQuotientAndRemainderWithoutDevideing(numA: Int, numB: Int) {
        var numberA = numA
        var count = 0

        while numberA >= numB {
            numberA = numberA - numB
            count += 1
        }

        print("Число А: \(numA)")
        print("Число B: \(numB)")

        print("Частное: \(count)")
        print("Остаток: \(numberA)")
    }

    func checkIsNumberHasOdd(number: Int) {
//        //var 1
//        var isHave = false
//
        var originNumBer = number
//
//        while originNumBer != 0 {
//            isHave = (originNumBer % 10) % 2 != 0
//            if isHave {
//                print("В \(number) есть нечетные числа")
//                originNumBer = 0
//            } else {
//                originNumBer /= 10
//            }
//        }
//
//        guard isHave == false else { return }
//
//        print("В \(number) нет нечетных чисел")

        //var 2
        while originNumBer > 0 {
            if originNumBer % 2 != 0 {
                print("В \(number) есть нечетные числа")
                return
            }
            originNumBer /= 10
        }

        print("В \(number) нет нечетных чисел")
    }

    func generateNumber() {
        
    }

    // MARK: - Автоморфные числа

    // Натуральное число называется автоморфным,
    // если оно равно последним цифрам своего квадрата.
    // Например, 25 ^ 2 = 625.
    // Напишите программу,
    // которая вводит натуральное число N и
    // выводит на экран все автоморфные числа,
    // не превосходящие N.

    func getAutomorphicNumbers(for n: Int) {
        // var 1
//        var number = n
//        guard number > 0 else { return }
//
//        while number != 0 {
//            var squareNumber = number * number
//
//            var originNumber = number
//            var flag = true
//
//            while (flag == true && squareNumber != 0 && originNumber != 0) {
//
//                if (squareNumber % 10  != originNumber % 10) {
//                    flag = false
//                }
//
//                originNumber = originNumber / 10
//                squareNumber = squareNumber / 10
//            }
//
//            if flag == true {
//                print("автоморфноое число \(number) <= \(n)")
//            }
//
//            number -= 1
//        }

        // var 2
        for i in 1...n {
            if isAutoMorph(number: i) {
                print("автоморфноое число \(i) <= \(n)")
            }
        }
    }

    private func isAutoMorph(number: Int) -> Bool {
        var temp = number
        var width = 1

        while temp > 0 {
            width *= 10
            temp /= 10
        }

        let square = power(base: number, sign: 2)
        return square % width == number
    }
}
