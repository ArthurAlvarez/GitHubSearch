//
//  GithubRepo.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import Foundation

struct GithubRepo: Codable {
    let name: String!
    let language: String!
    let watchers: Int!
    let forks: Int!
}

struct GithubRepoResponseWrapper: Codable {
    let items: [GithubRepo]!
}
