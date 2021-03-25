//
//  ProtocolMutaingVC.swift
//  SwfitTest
//
//  Created by mac on 2020/5/25.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit
/**
 “Swift 的 protocol 不仅可以被 class 类型实现，也适用于 struct 和 enum。因为这个原因，我们在写给别人用的协议时需要多考虑是否使用 mutating 来修饰方法，比如定义为 mutating func myMethod()。Swift 的 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，所以如果你没在协议方法里写 mutating 的话，别人如果用 struct 或者 enum 来实现这个协议的话，就不能在方法里改变自己的变量了。比如下面的代码”
 
 “如果把 protocol 定义中的 mutating 去掉的话，MyCar 就怎么都过不了编译了：保持现有代码不变的话，会报错说没有实现协议；如果去掉 mutating 的话，会报错说不能改变结构体成员。这个协议的使用者的忧伤的眼神，相信你能想象得出。

 另外，在使用 class 来实现带有 mutating 的方法的协议时，具体实现的前面是不需要加 mutating 修饰的，因为 class 可以随意更改自己的成员变量。所以说在协议里用 mutating 修饰方法，对于 class 的实现是完全透明，可以当作不存在的。”

 */

protocol Vehicle {
    
    var numberOfWheels: Int {get}
    
    var color: UIColor{get set}
    
    func changeColor()
}

class ProtocolMutaingVC: UIViewController, Vehicle {
    
    let numberOfWheels = 4
    var color = UIColor.red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func changeColor() {
        
        color = .blue
    }
    
}
