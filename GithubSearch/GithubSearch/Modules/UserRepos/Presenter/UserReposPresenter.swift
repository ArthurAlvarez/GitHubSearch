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

    private let username: String
    private let view: UserReposViewController!
    private let repository: UserReposRepositoryProtocol!

    // MARK: - Init

    init(view: UserReposViewController, username: String, repository: UserReposRepositoryProtocol) {
        self.view = view
        self.username = username
        self.repository = repository
    }

    // MARK: - Lifecycle

    func viewDidLoad() {
        view.setTableView()
        view.hideTableView()
        fetchRepos()
    }

    // MARK: - Fetch data

    private func fetchRepos() {
        view.showLoading()
        repository.fetchRepos(for: username) { success in
            self.view.hideLoading()
            if success {
                if self.repository.numberOfRepos() > 0 {
                    self.view.reloadData()
                    self.view.hideEmptyState()
                } else {
                    self.view.showEmptyState()
                }
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
