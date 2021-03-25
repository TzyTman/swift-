//
//  Animation_1.swift
//  SwfitTest
//
//  Created by fz on 2020/7/6.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

class Animation_1: UIViewController , CAAnimationDelegate{
    
    var loginBtn : UIButton?
    
    var imageView: UIImageView = UIImageView()
    
    var tempView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        //        tempView = UIView(frame: CGRect(x: 100, y: 200, width: 200, height: 300));
        //        tempView?.backgroundColor = UIColor.black
        //        self.view.addSubview(tempView!)
        ////
        //        // let animation:CABasicAnimation = CABasicAnimation()
        //        let animation: CAGradientLayer = CAGradientLayer()
        //        animation.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        //        animation.startPoint = CGPoint(x: 0, y: 0)
        //        animation.endPoint = CGPoint(x: 0, y: 1)
        //        let color = UIColor(red: 216.0/255.0, green: 114.0/225.0, blue: 213.0/255.0, alpha: 1.0)
        //        let color1 = UIColor(red: 61.0/255.0, green: 226.0/225.0, blue: 210.0/255.0, alpha: 1.0)
        //        animation.colors = [UIColor.clear.cgColor,color1.cgColor, color.cgColor]
        //        animation.locations = [0.0,0.1,0.2]
        //        tempView?.layer.addSublayer(animation)
        //
        //        let gradientAnimation: CABasicAnimation = CABasicAnimation()
        //        gradientAnimation.keyPath = "locations"
        //        gradientAnimation.fromValue = [0.0,0.1,0.2]
        //        gradientAnimation.toValue = [0.5,0.9,1.0]
        //        gradientAnimation.duration = 3.0
        //        gradientAnimation.repeatCount = 9;
        //        animation.add(gradientAnimation, forKey: nil);
        
        //        tempView?.layer.add(gradientAnimation, forKey: nil)
        //        self.view.layer.add(gradientAnimation, forKey: nil)
        
        /**
         Core Animation CABasicAnimation 核心动画
         */
                loginBtn = UIButton(frame: CGRect(x: 20, y: 230, width: self.view.frame.width-20*2, height: 50))
                loginBtn?.backgroundColor =  UIColor(red: 50/255.0, green: 185/255.0, blue: 170/255, alpha: 1.0)
                loginBtn?.setTitle("登陆", for: .normal);
                self.view.addSubview(loginBtn!)
        
        //2 关键帧动画
        
        let bgview:UILabel = UILabel()
        bgview.text = "My Name Is Tom"
//        bgview.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        bgview.sizeToFit()
        bgview.textColor = UIColor.red
        self.view.addSubview(bgview)
//
//        //--------------------  关键帧动画

//        let animationKey : CAKeyframeAnimation = CAKeyframeAnimation()
//        animationKey.duration = 1.0
//        animationKey.delegate = self
//        animationKey.keyPath = "opacity"
//
//        let valuesArray:[NSNumber] = [
//            NSNumber(value: 1.0 as Float),
//            NSNumber(value: 0.9 as Float),
//            NSNumber(value: 0.8 as Float),
//            NSNumber(value: 0.7 as Float),
//            NSNumber(value: 0.6 as Float),
//            NSNumber(value: 0.5 as Float),
//            NSNumber(value: 0.4 as Float),
//            NSNumber(value: 0.3 as Float),
//            NSNumber(value: 0.4 as Float),
//            NSNumber(value: 0.5 as Float),
//            NSNumber(value: 0.6 as Float),
//            NSNumber(value: 0.7 as Float),
//            NSNumber(value: 0.8 as Float),
//            NSNumber(value: 0.9 as Float),
//            NSNumber(value: 1.0 as Float)
//        ]
//        animationKey.values = valuesArray
//        animationKey.fillMode = .forwards
//        animationKey.isRemovedOnCompletion = false
//        animationKey.repeatCount = 2
//        bgview.layer.add(animationKey, forKey: nil)
        
        
        // 2 . 位移动画
                imageView.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
                imageView.contentMode = .scaleAspectFill
                imageView.image = UIImage(named: "login")
                self.view.addSubview(imageView)
        
                let pathLine: CGMutablePath = CGMutablePath()
                // pathLine.move(to: CGPoint(x: 50, y: 50))
                // pathLine.addLine(to: CGPoint(x: 300, y: 50))
        
                pathLine.move(to: CGPoint(x: 50, y: 50))
                pathLine.addArc(center: CGPoint(x: 200, y: 200), radius: 150, startAngle: 0, endAngle: CGFloat(M_PI_2), clockwise: true)
        
                let animation: CAKeyframeAnimation = CAKeyframeAnimation()
                animation.duration = 2.0
                animation.path = pathLine
                animation.keyPath = "position"
//                animation.fillMode = .forwards

                animation.isRemovedOnCompletion = false
                imageView.layer.add(animation, forKey: nil)
        
        
        //CAAnimationGroup 组合动画
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("关键帧动画结束了")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1. 移动动画
        //                let animation:CABasicAnimation = CABasicAnimation()
        //                animation.keyPath = "position"
        //                if let btn = loginBtn {
        //                    let positionX:CGFloat = btn.frame.origin.x + 0.5 * btn.frame.size.width;
        //                    let positionY:CGFloat = btn.frame.origin.y + 0.5 * btn.frame.size.height + 100;
        //                    animation.toValue = NSValue(cgPoint: CGPoint(x: positionX, y: positionY))
        //                    animation.duration = 2.0
        //                    animation.fillMode  = .forwards
        //                    animation.isRemovedOnCompletion = false
        //                    loginBtn?.layer.add(animation, forKey: nil)
        //                }
        
//        //2. 缩放动画
//                        let animation: CABasicAnimation =  CABasicAnimation()
//                        animation.keyPath  =  "transform.scale.x"
//                        animation.fromValue = 0.0
//                        animation.toValue = 1
//                        animation.duration = 3
//                        animation.fillMode  = .forwards
//                        animation.isRemovedOnCompletion = false
//                        loginBtn?.layer.add(animation, forKey: nil)
        
        // 3. 旋转动画
        //                let animation: CABasicAnimation =  CABasicAnimation()
        //                animation.keyPath  =  "transform.rotation"
        //                animation.fromValue = 1.0
        //                animation.toValue = 3.14/2
        //                animation.duration = 3
        //                animation.fillMode  = .forwards
        //                animation.isRemovedOnCompletion = false
        //                loginBtn?.layer.add(animation, forKey: nil)
        
        // 4. 位移动画
        //                let animation: CABasicAnimation =  CABasicAnimation()
        //                animation.keyPath  =  "transform.translation.y"
        //                //        animation.fromValue = 1.0
        //                animation.toValue = 100
        //                animation.duration = 3
        //                animation.fillMode  = .forwards
        //                animation.isRemovedOnCompletion = false
        //                loginBtn?.layer.add(animation, forKey: nil)
        
        //5. 圆角动画
        //                let animation: CABasicAnimation =  CABasicAnimation()
        //                animation.keyPath  =  "cornerRadius"
        //                //        animation.fromValue = 1.0
        //                animation.toValue = 15
        //                animation.duration = 2
        //                animation.fillMode  = .forwards
        //                animation.isRemovedOnCompletion = false
        //                loginBtn?.layer.add(animation, forKey: nil)
        
        //        //6. 边框动画
        //                let animation: CABasicAnimation =  CABasicAnimation()
        //                animation.keyPath  =  "borderWidth"
        //                //        animation.fromValue = 1.0
        //                animation.toValue = 10
        //                animation.duration = 3
        //                animation.fillMode  = .forwards
        //                animation.isRemovedOnCompletion = false
        //                loginBtn?.layer.add(animation, forKey: nil)
        
        //        //7. 颜色渐变动画
        //        let animation: CABasicAnimation =  CABasicAnimation()
        //        animation.keyPath  =  "backgroundColor"
        //        animation.fromValue = UIColor.green.cgColor
        //        animation.toValue = UIColor.red.cgColor
        //        animation.duration = 1
        //        animation.fillMode  = .both
        //        animation.isRemovedOnCompletion = false
        //        animation.repeatCount  = MAXFLOAT;
        //        loginBtn?.layer.add(animation, forKey: nil)
        
        //        //8. 淡入淡出动画
        //        let animation: CABasicAnimation =  CABasicAnimation()
        //        animation.keyPath  =  "opacity"
        //        animation.fromValue = 1
        //        animation.toValue = 0.3
        //        animation.duration = 3;
        //        animation.fillMode  = .forwards
        //        animation.isRemovedOnCompletion = false
        //        animation.repeatCount = MAXFLOAT
        //        loginBtn?.layer.add(animation, forKey: nil)
        //
        //9 .阴影渐变动画
        //        loginBtn?.layer.shadowColor = UIColor.red.cgColor
        //        loginBtn?.layer.shadowOpacity = 0.5
        //        let animation: CABasicAnimation =  CABasicAnimation()
        //        animation.keyPath  = "shadowOffset"
        //        animation.toValue =  NSValue(cgSize:CGSize(width: 10, height: 10))
        //        animation.duration = 3
        //        animation.fillMode  = .forwards
        //        animation.isRemovedOnCompletion = false
        //        loginBtn?.layer.add(animation, forKey: nil)
    }
    
}
