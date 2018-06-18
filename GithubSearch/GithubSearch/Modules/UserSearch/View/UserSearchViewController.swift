//
//  UserSearchViewController.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

final class UserSearchViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!

    // MARK: - Properties

    private var presenter: UserSearchPresenter!

    // MARK: - Methods

    static func instantiate() -> UserSearchViewController? {
        guard let view = instantiateFromStoryboard() as? UserSearchViewController else { return nil }
        view.presenter = UserSearchPresenter(view: view)
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = UserSearchPresenter(view: self)
        presenter.viewDidLoad()
    }

    func setTableView() {
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }

    func setSearchBar() {
        searchBar.placeholder = "Search users"
        searchBar.delegate = self
    }

    func reloadData() {
        tableView.reloadData()
    }

    func showTableView() {
        UIView.animate(withDuration: 0.25) {
            self.tableView.alpha = 1.0
        }
    }

    func hideTableView() {
        UIView.animate(withDuration: 0.25) {
            self.tableView.alpha = 0
        }
    }

    func showEmptyState() {
        hideTableView()
        emptyStateLabel.isHidden = false
    }

    func hideEmptyState() {
        showTableView()
        emptyStateLabel.isHidden = true
    }
}

// MARK: - UITableView DataSource & UITableView Delegate
extension UserSearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.cellForRow(tableView: tableView, index: indexPath.row)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.userTapped(at: indexPath.row)
    }
}

// MARK: - UISearchBarDelegate
extension UserSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        presenter.searchTapped(for: text)
        view.endEditing(true)
    }
}
