//
//  GithubUser.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import Foundation

struct GithubUser: Codable {
    let login: String!
    let avatar_url: String!
    let score: Double!
}
