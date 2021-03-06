//
//  GithubUserTableViewCell.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit
import Kingfisher

class GithubUserTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet weak private var avatarImageView: UIImageView!
    @IBOutlet weak private var usernameLabel: UILabel!
    @IBOutlet weak private var urlLabel: UILabel!

    // MARK: - Methods

    override func awakeFromNib() {
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 8
    }

    func setContent(with user: GithubUser) {
        // Set values
        avatarImageView.kf.setImage(with: URL(string: user.avatar_url), placeholder: nil)
        usernameLabel.text = user.login
        urlLabel.text = user.html_url

        usernameLabel.accessibilityIdentifier = "UsernameLabel"
        urlLabel.accessibilityIdentifier = "urlLabel"
    }
}
