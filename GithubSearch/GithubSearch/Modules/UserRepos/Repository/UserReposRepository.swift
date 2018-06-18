//
//  UserReposRepository.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import Foundation
import Moya

final class UserReposRepository: NSObject {

    // MARK: - Properties
    private var provider = MoyaProvider<GithubAPI>()
    private var repos: [GithubRepo] = []

    // MARK: - Methods

    func fetchRepos(for username: String, onComplete: @escaping (Bool) -> Void) {
        provider.request(.listRepositoriesFor(username: username)) { result in
            switch result {
            case .success(let response):
                if let responseWrapper = try? JSONDecoder().decode(GithubRepoResponseWrapper.self, from: response.data) {
                    self.repos = responseWrapper.items
                    onComplete(true)
                } else {
                    onComplete(false)
                }
            default:
                onComplete(false)
            }
        }
    }

    func numberOfRepos() -> Int {
        return repos.count
    }

    func getRepo(at index: Int) -> GithubRepo {
        return repos[index]
    }

}
