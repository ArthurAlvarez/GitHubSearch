//
//  UserSearchRepository.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import Foundation
import Moya

final class UserSearchRepository {

    // MARK: - Properties
    private var provider = MoyaProvider<GithubAPI>()
    private var users: [GithubUser] = []

    // MARK: - Methods

    func fetchUsers(query: String, onComplete: @escaping (Bool) -> Void) {
        provider.request(GithubAPI.searchUser(query: query)) { result in
            switch result {
            case .success(let response):
                self.users = (try? JSONDecoder().decode([GithubUser].self, from: response.data)) ?? []
                onComplete(true)
            default:
                onComplete(false)
            }
        }
    }

    func usersCount() -> Int {
        return users.count
    }

    func getUserAt(index: Int) -> GithubUser {
        return users[index]
    }
}
