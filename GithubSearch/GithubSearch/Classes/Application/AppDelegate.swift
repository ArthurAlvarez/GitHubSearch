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
        guard let navigationController = UIStoryboard(name: "GithubSearch", bundle: nil).instantiateInitialViewController() as? UINavigationController, let initialVC = UserSearchViewController.instantiate() else { return false }

        navigationController.viewControllers = [initialVC]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        return true
    }
}

