//
//  AppDelegate.swift
//  Lesson19-Filter
//
//  Created by Владислав Галкин on 08.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let filterManager = Filter()
        window?.rootViewController = UINavigationController(rootViewController: ViewController(filterManager: filterManager))
        window?.makeKeyAndVisible()
        return true
    }
}

