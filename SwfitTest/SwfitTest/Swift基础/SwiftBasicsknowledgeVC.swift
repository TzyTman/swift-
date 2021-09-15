//
//  SwiftBasicsknowledgeVC.swift
//  SwfitTest
//
//  Created by fz on 2020/9/19.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

class daysoFaweek {
    
    private var days = ["Sunday" , "Monday" , "Tuesday" , "Wednesday", "Thursday" , "Friday" , "saturday"]
    
    subscript(index: Int) -> String {
        
        get {
            return days[index]
        }
        
        set(newValue){
            self.days[index] = newValue
        }
    }
}

class SampleClass {
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
}

class SwiftBasicsknowledgeVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let i = 0
        for i in i...100 where i%3 == 0 {
            print(i)
        }
        
        let http404Error  = (404 , "Not Found")
        print(http404Error.0)
        
        let ageNumber:Int?
        ageNumber = 12
        if let ageNumber1 = ageNumber {
            print(ageNumber1)
        }
        
        print(add(a: 1, b: 1))
        
        showWarning(str: "张三")
        
        showStudentInfo(sName: "张三", sage: 16, sHeight: 2, sPhone: "7373647364")
        
        enumeration();
        
        Closures();
        
        subscriptFunc();
        
        OptionalChainingFunc()
        
        
        //---- 进阶
        
        let addTwo = addTo(2)
        let result = addTwo(6)
        
        print(result)
    }
    
    
    //定义一个函数，返回值是Int类型
    func add(a:Int,b:Int) -> Int {
        return a+b
    }
    
    //无参数类型函数
    func showWarning() {
        print("警告")
    }
    
    func showWarning(str:String)  {
        print("警告"+str)
    }
    
    func showStudentInfo(sName name:String , sage age:Int , sHeight height:Int, sPhone phoneNumber:String)  {
        print("学生:\(name) 年龄:\(age) 身高:\(height) 电话：\(phoneNumber)")
    }
    
    enum Toward {
        case Forward
        case Back
        case Left
        case Right
    }
    
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    
    enum Beverage:CaseIterable {
        case coffee
        case tea
        case juice
    }
    
    enum Barcode {
        case upc(Int , Int , Int , Int)
        case qrCode(String)
    }
    
    enum ASCIIcontrolCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    
    /**
     枚举
     */
    func enumeration()  {
        // directionToHead的类型是已知的，所以当设定它的值时你可以不用写类型。这样做可以使得你在操作确定类型的枚举时让代码非常易读。
        var directionToHead = CompassPoint.west
        
        directionToHead = .east
        
        print(directionToHead)
        
        //使用Switch 语句来匹配枚举值
        directionToHead = .south
        
        switch directionToHead {
        case .north:
            print("Lost of planets have a north")
        case .south:
            print("watch out for penguins")
        case .east:
            print("where the sun rises")
        case .west:
            print("where the skies are blue")
        }
        
        let numberOfChoices = Beverage.allCases.count
        print("\(numberOfChoices) beverages available")
        
        //遍历枚举
        for beverage in Beverage.allCases {
            print(beverage)
        }
        
        //枚举关联值
        var productBarcode = Barcode.upc(8, 85909, 51226, 3)
        productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
        
        switch productBarcode {
        case .upc(let numberSystem, let manufacturer, let product, let check):
            print("UPC:\(numberSystem),\(manufacturer),\(product),\(check)")
        case .qrCode(let productCode):
            print("QR code:\(productCode)")
        }
        //枚举原始值
    }
    
    //闭包
    func Closures()  {
        
        let studName = {
            print("闭包实例")
        }
        print(studName)
        
        let divide = {(var1:Int ,var2:Int) -> Int in
           return var1 / var2
        }
        let result = divide(200,20)
        print(result)
        
        let names = ["AT","AE","D","S","BE"]
        let reversed = names.sorted(by: backWards(s1:s2:))
        print(reversed)
        
        
        var stopLights = 4

        if let townPlanByaddingLightsTo = makeTownGrand(withBudget: 10000, condition: evaluate) {
            
            stopLights = townPlanByaddingLightsTo(4 , stopLights)
        }

        if let newtownPlanByaddingLightsTo = makeTownGrand(withBudget: 10500, condition: evaluate) {
            stopLights = newtownPlanByaddingLightsTo(4,stopLights)
        }

        print("Knowhere has \(stopLights) stoplights.")
        
        
        var currentPopulation = 5422

        let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)

        growBy(500)
        growBy(500)
        growBy(500)

        currentPopulation = growBy(500)

        let anotherGrowBy = growBy
        anotherGrowBy(500)

        print(anotherGrowBy(500))
        
    }
    
    func backWards(s1: String , s2: String) -> Bool {
        return s1 > s2
    }
    
    //函数作为参数
//    func make1(withBudfet budget:Int, condition:(Int)->Bool) -> ((Int, Int) ->Int)? {
//
//        if condition(budget) {
//
//            func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int)-> Int {
//
//                return lights + existingLights
//            }
//            return buildRoads
//        }else {
//            return nil
//        }
//    }
//
//    func evaluate(budget: Int) -> Bool {
//        return budget > 10000
//    }
    
    //实例三
    func makeTownGrand(withBudget budget: Int, condition:(Int)-> Bool) -> ((Int , Int)->Int)? {
        
        if condition(budget) {
            
            func buildRoads(byAddingLights lights: Int, toExisting existingLights: Int) -> Int {
                
                return lights + existingLights
            }
            
            return buildRoads
            
        }else {
            
            return nil
        }
    }

    func evaluate(budget: Int)-> Bool {
        return budget>10000
    }
    
    //闭包是引用类型
    func makePopulationTracker(forInitialPopulation population: Int) ->(Int)-> Int{
        
        var totalPopulation = population
        
        func populationTracker(growth:Int)->Int {
            
            totalPopulation += growth
            return totalPopulation
        }
        return populationTracker
    }



    struct subexample {
        let decrementer: Int
        subscript(index: Int) -> Int {
            return decrementer / index
        }
    }
    
    //下标 subscript
    func subscriptFunc()  {
        
        let division = subexample(decrementer: 100)
        print(division[9])
        
        let p = daySofaweek()
        p[0] = "张三"
        print(p[0])
        print(p[1])
    }
    /// 可选链
    func OptionalChainingFunc() {
        
        let spClass1 = SampleClass(s: "Hello")
        let spClass2 = SampleClass(s: "Hello")

        if spClass1 === spClass2 {// false
            print("引用相同的类实例 \(spClass1)")
        }
        
        if spClass1 !== spClass2 {// true
            print("引用不相同的类实例 \(spClass2)")
        }
    }
    
    //----- 第二阶段 进阶
    func addTo(_ adder: Int) -> (Int) -> Int {
        return {
            num in
            return num + adder
        }
    }
}





