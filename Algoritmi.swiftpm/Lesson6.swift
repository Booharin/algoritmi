//
//  File.swift
//  Algoritmi
//
//  Created by Alexandr Booharin on 09.07.2022.
//

import Darwin

final class Lesson6: LessonProtocol {
    let values = [8, 3, 57, 13, 25, 61, 99, 28, 7]
    var i = 0

    func runAlgoritms() {
        var tree: TreeNode<Int>? = getTreeForValues(n: values.count)
        printTree(root: tree)
        print("\n")
        preOrderTravers(root: tree)
        print("\n")
        print(searchValueInTree(value: 13, tree: tree))
    }

    func runHomeWork() {

    }

    func getTree<T>(n: Int) -> TreeNode<T>? {
        var newNode: TreeNode<T>?

        if n == 0 {
            return newNode
        } else {
            let value = Int(arc4random() % 100)

            let nL = n / 2
            let nR = n - nL - 1

            newNode = TreeNode<T>()

            newNode?.data = value as? T
            newNode?.leftNode = getTree(n: nL)
            newNode?.rightNode = getTree(n: nR)
        }

        return newNode
    }

    // можно добавить аргумент именно индекс, который будет увеличиваться рекурсивно
    func getTreeForValues<T>(n: Int) -> TreeNode<T>? {
        var newNode: TreeNode<T>?

        if n == 0 {
            return newNode
        } else {
            let value = values[i]
            i += 1

            let nL = n / 2
            let nR = n - nL - 1

            newNode = TreeNode<T>()

            newNode?.data = value as? T
            newNode?.leftNode = getTreeForValues(n: nL)
            newNode?.rightNode = getTreeForValues(n: nR)
        }

        return newNode
    }

    func preOrderTravers<T>(root: TreeNode<T>?) {
        if root != nil {
            print(root?.data)
            preOrderTravers(root: root?.leftNode)
            preOrderTravers(root: root?.rightNode)
        }
    }

    func simmetricTravers<T>(root: TreeNode<T>?) {
        if root != nil {
            simmetricTravers(root: root?.leftNode)
            print(root?.data)
            simmetricTravers(root: root?.rightNode)
        }
    }

    func backTravers<T>(root: TreeNode<T>?) {
        if root != nil {
            backTravers(root: root?.leftNode)
            backTravers(root: root?.rightNode)
            print(root?.data)
        }
    }

    func searchValueInTree<T>(value: T, tree: TreeNode<T>?) -> T? {
//        if tree == nil {
//            return nil
//        } else {
//            if tree?.data == value {
//                return value
//            } else if tree?.leftNode != nil {
//                return searchValueInTree(value: value, tree: tree?.leftNode)
//            } else {
//                return searchValueInTree(value: value, tree: tree?.rightNode)
//            }
//        }

        var result: T? = nil
        if tree != nil {
            result = searchValueInTree(value: value, tree: tree?.rightNode)
            if result == nil {
                result = searchValueInTree(value: value, tree: tree?.leftNode)
            }
            if tree?.data == value {
                result = value
            }
        }
        return result
    }

//    void printTree(Node *root) {
//        if (root)
//        {
//            printf("%d", root->data);
//            if (root->left || root->right)
//            {
//                printf("(");
//                if (root->left)
//                    printTree(root->left);
//                else
//                    printf("NULL");
//                printf(",");
//                if (root->right)
//                    printTree(root->right);
//                else
//                    printf("NULL");
//                printf(")");
//            }
//        }
//    }

    func printTree<T>(root: TreeNode<T>?) {
        if let tree = root {
            if let data = tree.data {
                print(data, terminator: "")
            }

            if tree.leftNode != nil || tree.rightNode != nil {
                print("(", terminator: "")
                if tree.leftNode != nil {
                    printTree(root: tree.leftNode)
                } else {
                    print("nil", terminator: "")
                }
                print(",", terminator: "")
                if tree.rightNode != nil {
                    printTree(root: tree.rightNode)
                } else {
                    print("nil", terminator: "")
                }
                print(")", terminator: "")
            }
        }
    }
}

extension Lesson6 {
    
}

final class TreeNode<T: Comparable> {
    var data: T?
    var leftNode: TreeNode<T>?
    var rightNode: TreeNode<T>?
    var parent: TreeNode<T>?
//
//    init () {}
//
//    convenience init(
//        data: T?,
//        leftNode: TreeNode<T>?,
//        rightNode: TreeNode<T>?
//    ) {
//        self.init()
//        self.data = data
//        self.leftNode = leftNode
//        self.rightNode = rightNode
//    }
}
