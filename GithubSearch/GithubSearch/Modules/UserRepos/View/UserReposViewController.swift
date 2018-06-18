//
//  UserReposViewController.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import UIKit

final class UserReposViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    private var presenter: UserReposPresenter!

    // MARK: - Methods

    static func instantiate(with username: String) -> UserReposViewController? {
        guard let view = instantiateFromStoryboard() as? UserReposViewController else { return nil }
        view.presenter = UserReposPresenter(view: view, username: username)
        view.title = "\(username)'s Repos"
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    func setTableView() {
        tableView.rowHeight = 100
        tableView.dataSource = self
    }

    func reloadData() {
        tableView.reloadData()
    }
}

extension UserReposViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.cellForRow(tableView: tableView, at: indexPath.row)
    }
}
