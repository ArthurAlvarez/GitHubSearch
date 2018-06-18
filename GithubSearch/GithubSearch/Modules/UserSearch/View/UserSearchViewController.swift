//
//  UserSearchViewController.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {

    // MARK: - Properties

    let presenter = UserSearchPresenter()

    // MARK: - Methods

    static func instantiate() -> UserSearchViewController? {
        return instantiateFromStoryboard() as? UserSearchViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
