//
//  AppDelegate.swift
//  SwfitTest
//
//  Created by tuzhengyao on 2020/4/22.
//  Copyright © 2020 tuzhengyao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigation: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        let vc = ViewController()
        self.navigation = UINavigationController.init(rootViewController: vc)
        self.navigation?.navigationBar.isTranslucent = false
        self.window?.rootViewController = self.navigation
        self.window?.makeKeyAndVisible()
        return true 
    }
}

