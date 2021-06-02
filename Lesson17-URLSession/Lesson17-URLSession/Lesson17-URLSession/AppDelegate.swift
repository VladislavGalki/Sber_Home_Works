//
//  AppDelegate.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let networkService = CommentsNetworkService()
        window?.rootViewController = ViewController(networkService: networkService)
        window?.makeKeyAndVisible()
        return true
    }
}
