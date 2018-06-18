//
//  AppDelegate.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        guard let initialVC = UIStoryboard(name: "GithubSearch", bundle: nil).instantiateInitialViewController() else { return false }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = initialVC
        return true
    }
}

