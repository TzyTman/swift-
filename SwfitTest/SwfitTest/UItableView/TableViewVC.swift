//
//  TableViewVC.swift
//  SwfitTest
//
//  Created by mac on 2020/6/10.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

class TableViewVC: UIViewController {
    
    /**
     懒加载
     */
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: UIScreen.main.bounds, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
    }
}

extension TableViewVC: UITableViewDelegate {
}

extension TableViewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 120;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView.init(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 120) );
        view.backgroundColor = UIColor.blue
        return view
    }
    
}
