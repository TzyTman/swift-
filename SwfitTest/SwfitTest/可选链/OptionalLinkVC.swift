//
//  OptionalLinkVC.swift
//  SwfitTest
//
//  Created by fz on 2020/11/20.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

class Residence {
    
    var rooms = [Room]()
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get{
            return rooms[i]
        }
        
        set  {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        
        print("the number of rooms is \(numberOfRooms)")
    }
    
    
}

class Person {
    
    var residence: Residence?
}

class Room {
    
    let name: String
    init(name: String) {
        self.name = name
    }
}


class Address {
    
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}


//可选链是一个调用和查询可选属性、方法和下标的过程，它可能为 nil 。如果可选项包含值，属性、方法或者下标的调用成功；如果可选项是 nil ，属性、方法或者下标的调用会返回 nil 。多个查询可以链接在一起，如果链中任何一个节点是 nil ，那么整个链就会得体地失败。
class OptionalLinkVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
        
        //可选链代替强制展开
        let john = Person()
        john.residence = Residence()
        print(john)
        
        if let roomCount = john.residence?.numberOfRooms {
            print("John s residence has\(roomCount) room(s).")
        }else {
            print("Unable to retrieve the number of rooms")
        }
        
        john.residence = Residence()
        if let roomCount = john.residence?.numberOfRooms {
            print("John s residence has\(roomCount) room(s).")
        }else {
            print("Unable to retrieve the number of rooms")
        }
    }
}
