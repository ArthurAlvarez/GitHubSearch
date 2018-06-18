//
//  UserReposPresenter.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit
import NotificationBannerSwift

class UserReposPresenter: NSObject {

    // MARK: - Properties

    private let repository: UserReposRepository = UserReposRepository()
    private let username: String
    private let view: UserReposViewController!

    // MARK: - Init

    init(view: UserReposViewController, username: String) {
        self.view = view
        self.username = username
    }

    // MARK: - Lifecycle

    func viewDidLoad() {
        view.setTableView()
        fetchRepos()
    }

    // MARK: - Fetch data

    private func fetchRepos() {
        view.showLoading()
        repository.fetchRepos(for: username) { success in
            self.view.hideLoading()
            if success {
                self.view.reloadData()
            } else {
                self.view.showConnectionErrorBanner()
            }
        }
    }

    // MARK: - Data source

    func numberOfRows() -> Int {
        return repository.numberOfRepos()
    }

    func cellForRow(tableView: UITableView, at index: Int) -> UITableViewCell {
        let cell: GithubRepoTableViewCell? = GithubRepoTableViewCell.dequeued(from: tableView)
        cell?.setContent(with: repository.getRepo(at: index))
        return cell ?? UITableViewCell()
    }
}
