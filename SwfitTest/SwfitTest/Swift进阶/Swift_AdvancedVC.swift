//
//  Swift_AdvancedVC.swift
//  SwfitTest
//
//  Created by mac on 2020/5/25.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>:
TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpinside
    case ValueChanged
}

class Control {
    
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T,
                                 action: @escaping (T) -> () -> (),
                                 controlEvent: ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(
            target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        
        actions[controlEvent]?.performAction()
    }
}

//MARK: --- Optional Chaining 可选链使用
class Toy { //玩具
    
    let name: String
    
    init(name: String) {
        
        self.name = name
    }
}

extension Toy {
    
    func play() {}
}

class Pet { //宠物
    
    var toy: Toy?
}


class Child {
    
    var pet: Pet?
}


/// swift 进阶第一篇
class Swift_AdvancedVC: UIViewController {
    
    //数字相加
    func addTo(_ adder: Int) -> (Int) -> Int {
        return {
            num in
            return num + adder
        }
    }
    
    //比较大小
    func greaterThan(_ comparer:Int) -> (Int) -> Bool {
        return {
            $0 > comparer
        }
    }
    
    public typealias block = (Int) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "swift 进阶第一篇"
        
        // Do any additional setup after loading the view.
        /**“Swift 里可以将方法进行柯里化 (Currying)，这是也就是把接受多个参数的方法进行一些变形，使其更加灵活的方法。函数式的编程思想贯穿于 Swift 中，而函数的柯里化正是这门语言函数式特点的重要表现” */
        let addtwo = addTo(8)
        print(addtwo(8))
        
        let greaterThan10 = greaterThan(10)
        print(greaterThan10(13))
        
        var number1  = 10
        var number2  = 20
        
        let str :String = "tuzhengyao"
        //log打印
        logPrint(str)
        
        
        swapMe2(a: &number1, b: &number2)
        
        //        logifTrue { () -> Bool in
        //            return 2 > 1
        //        }
        
        logifTrue(2>1)
        
        //        blocks { (number) in
        //
        //            print(number)
        //        }
        
        blocks {(number) in
            print(number)
        }
        testBlock { (numebr1, number2) in
            print(numebr1 , number2)
        }
        
        // MARK:--- 可选链使用
        _ = Toy.init(name: "变形金刚")
        let xiaoming = Child()
        
        if let toyname = xiaoming.pet?.toy?.name {
            print(toyname)
        }
        
        
        let playClosure = { (child: Child) -> ()? in
            child.pet?.toy?.play()
        }
        
        if let _:() = playClosure(xiaoming) {
            print("好开心")
        }else {
            print("每月玩具可以玩啊")
        }
        
        // MARK:--- 操作符
        let v1 = Vector2D(x: 2.0, y: 3.0)
        print(v1.x , v1.y)
        
        //MARK:--- MAX MIN
        intMINAndMAX()
    }
    
    //MARK:--- 多元组实现数据交换
    func swapMe2<T>( a: inout T, b: inout T) {
        (a,b) = (b,a)
    }
    /**
     “@autoclosure 可以说是 Apple 的一个非常神奇的创造，因为这更多地是像在 “hack” 这门语言。简单说，@autoclosure 做的事情 就是把一句表达式自动地封装成一个闭包 (closure)。这样有时候在语法上看起来就会非常漂亮。”
     */
    func logifTrue(_ predicate:@autoclosure() ->Bool) {
        
        if predicate() {
            print("true")
        }
    }
    
    func blocks(_ tempBlock: block) {
        tempBlock(5)
    }
    
    //(Int) -> Void
    func testBlock(_ tempBlock:(_ number1:Int,_ number2:Int)->()){
        tempBlock(7,8)
    }
    
    //   func +(left: Vector2D, right: Vector2D) -> Vector2D {
    //        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    //    }
    
    func logPrint<T>(_ message: T,
                     file: String = #file,
                     method: String = #function,
                     line: Int = #line)
    {
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    }
    
    func intMINAndMAX() {
        
        let minValue = UInt8.min
        let maxValue = UInt8.max
        
        print(minValue , maxValue)
        
        //类型转换
        let num1 = 1
        let num2 = 1.09
        
        let num3 = Double(num1) + num2
        
        print(num3)
        
        //元祖
        let http404Error = (404 , "Not Found")
        print(http404Error.0 , http404Error.1)
    }
}

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

