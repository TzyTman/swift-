//
//  GenericProgrammingVC.swift
//  SwfitTest
//
//  Created by mac on 2020/5/25.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

//MARK: --- 关联类
/**
 Swift 中使用 associatedtype 关键字来设置关联类型实例。
 
 下面例子定义了一个 Container 协议，该协议定义了一个关联类型 ItemType。
 
 Container 协议只指定了三个任何遵从 Container 协议的类型必须提供的功能。遵从协议的类型在满足这三个条件的情况下也可以提供其他额外的功能。
 */
protocol Container {
    associatedtype ItemType
    // 添加一个新元素到容器里
    mutating func append(_ item: ItemType)
    // 获取容器中元素的数
    var count: Int {get}
    // 通过索引值类型为 Int 的下标检索到容器中的每一个元素
    subscript(i:Int)->ItemType{get}
}

// Stack 结构体遵从 Container 协议
struct Stack<Element>: Container{
    
    var items = [Element]()
    
    mutating func push(_ item: Element){
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    //Container 协议部分
    mutating  func append(_ item: ItemType) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        
        return items[i]
    }
}

/**
 Where 语句
 类型约束能够确保类型符合泛型函数或类的定义约束。

 你可以在参数列表中通过where语句定义参数的约束。

 你可以写一个where语句，紧跟在在类型参数列表后面，where语句后跟一个或者多个针对关联类型的约束，以及（或）一个或多个类型和关联类型间的等价(equality)关系。
 */
// 扩展，将 Array 当作 Container 来使用
extension Array: Container {}
 
func allItemsMatch<C1: Container, C2: Container> (_ someContainer: C1, _ anotherContainer: C2) -> Bool
    
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
        
        // 检查两个容器含有相同数量的元素
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // 检查每一对元素是否相等
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        // 所有元素都匹配，返回 true
        return true
}


//MARK:  --- 泛型扩展
extension Stack {
    
    var topItem: Element? {
        
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

//MARK: --- 类型约束 类型约束指定了一个必须继承自指定类的类型参数，或者遵循一个特定的协议或协议构成。
/**
 类型约束语法
 你可以写一个在一个类型参数名后面的类型约束，通过冒号分割，来作为类型参数链的一部分。这种作用于泛型函数的类型约束的基础语法如下所示（和泛型类型的语法相同）
 func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
 // 这里是泛型函数的函数体部分
 }
 */

class GenericProgrammingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "泛型"
        
        // Do any additional setup after loading the view.
        //实例1
        var number1 = 100
        var number2 = 200
        swapTwoValues(&number1, &number2)
        
        var str1 = "你好"
        var str2 = "不好"
        swapTwoValues(&str1, &str2)
        
        //实例2
//        var stackOfStrings = Stack<String>()
//        stackOfStrings.push("google")
//        stackOfStrings.push("runoob")
//        print(stackOfStrings.items)
//
//        let deleteos = stackOfStrings.pop()
//        print("出栈元素:" + deleteos)
//
//        var stackOFInt = Stack<Int>()
//        stackOFInt.push(11)
//        stackOFInt.push(12)
//        print(stackOFInt.items)
//
//        let delete = stackOFInt.pop()
//        print("出栈元素:\(delete)")
//
//        if let topItem = stackOfStrings.topItem {
//            print("栈中的顶部元素是:\(topItem).")
//        }
        
//        var tos = Stack<String>()
//        tos.push("google")
//        tos.push("runoob")
//        tos.push("taobao")
//        tos.append("baidu")
//        // 元素列表
//        print(tos.items)
//        // 元素个数
//        print( tos.count)
        
        var tos = Stack<String>()
        tos.push("google")
        tos.push("runoob")
        tos.push("taobao")
         
        let aos = ["google", "runoob", "taobao"]
         
        if allItemsMatch(tos, aos) {
            print("匹配所有元素")
        } else {
            print("元素不匹配")
        }
        
    }
    /**
     泛型使用了占位类型名（在这里用字母 T 来表示）来代替实际类型名（例如 Int、String 或 Double）。
     */
    func swapTwoValues<T>(_ a : inout T , _ b : inout T) {
        let temporaryA  = a
        a = b
        b = temporaryA
    }
}
