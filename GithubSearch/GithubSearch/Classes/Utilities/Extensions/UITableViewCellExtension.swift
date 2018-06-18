//
//  UITableViewCellExtension.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static func dequeued<T>(from tableView: UITableView) -> T? {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: self)) as? T
    }
}

