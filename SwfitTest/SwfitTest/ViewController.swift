//
//  ViewController.swift
//  SwfitTest
//
//  Created by tuzhengyao on 2020/4/22.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-90), style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    lazy var array: [String] = {
        let array = ["APP架构","RxSwift学习","Swift进阶第一篇","泛型",
                     "Swift下标脚本","RxSwift核心","Animation" ,
                     "Swift OC 混合开发","UITableView","ReactiveCocoa","Swift基础","GCD_Test详解","可选链接","离屏渲染"]
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "swift学习用例"
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let titleName = array[indexPath.row]
        if titleName == "RxSwift学习" {
//            let vc = ViewController2()
//            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "Swift进阶第一篇" {
            let vc = Swift_AdvancedVC.init(nibName: "Swift_AdvancedVC", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "泛型" {
            let vc = GenericProgrammingVC.init(nibName: "GenericProgrammingVC", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "Swift下标脚本" {
            let vc = subscriptTestVC.init(nibName:"subscriptTestVC" , bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "RxSwift核心"{
            let vc = RxSwiftVC.init(nibName: "RxSwiftVC", bundle: nil)
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "Animation" {
            let vc = Animation_1.init()
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "Swift OC 混合开发" {
//            let vc = admixtureVC.init()
//            navigationController?.pushViewController(vc, animated: true)
            let vc = OCVC.init(nibName: "OCVC", bundle: nil)
//            let vc = UIBezierPathTest_VC.init()
            navigationController?.pushViewController(vc, animated: true)
            
        }else if titleName == "UITableView" {
            let vc = TableViewVC.init()
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "ReactiveCocoa" {
            let vc = ReactiveCocoa.init()
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "Swift基础" {
            let vc = SwiftBasicsknowledgeVC.init(nibName: "SwiftBasicsknowledgeVC", bundle: nil);
            navigationController?.pushViewController(vc, animated: true);
        }else if titleName == "GCD_Test详解" {
            let vc = GCD_Test.init();
            navigationController?.pushViewController(vc, animated: true);
        }else if titleName == "可选链接" {
            let vc = OptionalLinkVC.init()
            navigationController?.pushViewController(vc, animated: true)
            
        }else if titleName == "离屏渲染" {
            let vc = ScreenRendering.init()
            navigationController?.pushViewController(vc, animated: true)
        }else if titleName == "Swfit基础学习" {
            
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(array[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
}
