//
//  AppDelegate.swift
//  Lesson11-UIViewController
//
//  Created by Владислав Галкин on 18.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let rootController = UINavigationController(rootViewController: ViewController())
        let secondVC = UINavigationController(rootViewController: SecondViewController())
        let tabBarController = UITabBarController()
        let item1 = UITabBarItem.init(tabBarSystemItem: .bookmarks, tag: 0)
        let item2 = UITabBarItem.init(tabBarSystemItem: .search, tag: 1)
        rootController.tabBarItem = item1
        secondVC.tabBarItem = item2
        tabBarController.viewControllers = [rootController, secondVC]
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }
    
}

