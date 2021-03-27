//
//  AnimationVC.swift
//  SwfitTest
//
//  Created by mac on 2020/6/2.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit
//import Kingfisher

class AnimationVC: UIViewController {
    
    lazy var view1: UIView = {
        let view1 = UIView.init(frame: CGRect(x: 110, y: 0, width: 100, height: 100))
        view1.backgroundColor = UIColor.red
        return view1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Animation"
        //print("\(firstNumber) < \(secondNumber) < 100")
        
        print("x轴 \(UIScreen.main.bounds.origin.x) y轴 \(UIScreen.main.bounds.origin.y) 宽 \(UIScreen.main.bounds.size.width) 高 \(UIScreen.main.bounds.height)")

        
        // Do any additional setup after loading the view.
        
        //        let view1 = UIView.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        //        view1.backgroundColor = UIColor.blue
        //        view1.bounds = CGRect(x: 100, y: 100, width: 100, height: 100)
        //        self.view.addSubview(view1)
        //
        //        let view2 = UIView.init(frame: CGRect(x: 100+((100-50)/2), y: 90, width: 50, height: 50))
        //        view2.backgroundColor = UIColor.red
        //        view1.addSubview(view2)
        
        
        
        self.view.addSubview(view1)

        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.blue
        btn.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        btn.setTitle("触发动画", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.addTarget(self, action: #selector(eventClick(btn:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        animationGJZ()

    }
    
    @objc func eventClick(btn: Any) {
        
            /**
                 放在 performWithoutAnimation 闭包中就会不执行动画了， 这个在有时候做项目的时候某个功能总是会莫名其妙的调一下或者执行一个很奇怪的动画，这时候可以把那段 code 放在这个闭包中，就不会有动画了。
                 */
//                UIView.animate(withDuration: 0.4) {
//                    self.view1.backgroundColor = UIColor.red
//                    self.view1.center.y  += 10
//                    UIView.performWithoutAnimation { //如果我们想让一个属性在 animations 闭包中执行，但是又不要执行动画，可以这样。
//                        self.view1.alpha = 0
//                    }
//                }
        
        //2 UIView 动画比较完整的版本并不是上面那么简短，还有很多其他的参数可以配置
        /**
         withDuration：动画的持续时间，也可理解为动画的执行速度，持续时间越小速度越快
         delay：动画开始之前的延时，默认是无延时。
         options：一个附加选项，UIViewAnimationOptions 可以指定多个
         animations：执行动画的闭包
         completion：动画完成后执行的闭包，可以为nil，可以在这里链接下一个动画。
         
         下面是一些主要的options (UIViewAnimationOptions) :

         动画执行对应的曲线（缓冲）: 动画执行过程速度的改变，会有一个加速度或者一个减速度。
         .curveEaseIn
         .curveEaseOut
         .curveEaseInOut
         .curveLinear
         
         .repeat ： 指定这个选项后，动画会无限重复
         .autoreverse：往返动画，从开始执行到结束后，又从结束返回开始。
         <#T##UIView.AnimationOptions#>
         */
        
        //如果想让这个动画无限次循环，只需要加一个option
        let opts: UIView.AnimationOptions = [.autoreverse , .repeat]

        UIView.animate(withDuration: 0.3, delay: 0, options: opts, animations: {
              self.view1.backgroundColor = UIColor.blue
              self.view1.frame = CGRect(x: 110, y: 90, width: 100, height: 100)
        }, completion: { (bool) in
              self.view1.frame = CGRect(x: 110, y: 110, width: 100, height: 100)
        })
    }
    

    //关键帧动画
    func animationGJZ(){
        print("哈哈哈");
    }
}
