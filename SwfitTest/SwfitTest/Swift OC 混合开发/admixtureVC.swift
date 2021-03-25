//
//  admixtureVC.swift
//  SwfitTest
//
//  Created by mac on 2020/6/3.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

class admixtureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
            
        // Do any additional setup after loading the view.
        let url = NSURL(string: "http://5b0988e595225.cdn.sohucs.com/q_mini,c_zoom,w_640/images/20171122/a6ac310122b646918112abf3bdf71188.gif")
//      let imageView = UIImageView.init(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        let imageView = YYAnimatedImageView.init(frame: CGRect(x: 100, y: 100, width: 150, height: 150))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.yy_setImage(with: url as URL?, placeholder: nil)
        imageView.yy_setImage(with: url as URL?, options: .progressive)
        self.view.addSubview(imageView)
        
      
//        POPBasicAnimation.default()
//        POPBasicAnimation.linear()
//        POPBasicAnimation.easeInEaseOut()
//
        
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
