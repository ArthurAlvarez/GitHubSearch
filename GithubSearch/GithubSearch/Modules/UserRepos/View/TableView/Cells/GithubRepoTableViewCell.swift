//
//  GithubRepoTableViewCell.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

final class GithubRepoTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var languageLabel: UILabel!
    @IBOutlet weak private var watchersLabel: UILabel!
    @IBOutlet weak private var forksLabel: UILabel!

    // MARK: - Methods

    func setContent(with repo: GithubRepo) {
        nameLabel.text = repo.name

        languageLabel.text = "Language: \(repo.language ?? "-")"
        watchersLabel.text = "Watchers: \(repo.watchers ?? 0)"
        forksLabel.text = "Forks: \(repo.forks ?? 0)"
    }
}
