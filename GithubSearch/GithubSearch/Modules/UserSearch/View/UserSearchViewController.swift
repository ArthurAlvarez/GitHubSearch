//
//  UserSearchViewController.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

class UserSearchViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!

    // MARK: - Properties

    private var presenter: UserSearchPresenter!

    // MARK: - Methods

    static func instantiate() -> UserSearchViewController? {
        return instantiateFromStoryboard() as? UserSearchViewController
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
        searchBar.delegate = self
    }

    func reloadData() {
        tableView.reloadData()
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
