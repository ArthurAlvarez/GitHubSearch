//
//  UIViewControllerExtension.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit
import MBProgressHUD
import NotificationBannerSwift

extension UIViewController {
    static func instantiateFromStoryboard(storyboardName: String = "GithubSearch") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self))
    }

    func showLoading() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }

    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }

    func pushViewController(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    func showConnectionErrorBanner() {
        NotificationBanner(title: "Falha ao carregar dados", subtitle: "Tente novamente", style: .danger).show()
    }
}
