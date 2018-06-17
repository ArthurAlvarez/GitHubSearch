//
//  GithubAPI.swift
//  GithubSearch
//
//  Created by Arthur Alvarez on 17/06/2018.
//  Copyright © 2018 Arthur Alvarez. All rights reserved.
//

import Foundation
import Moya

enum GithubAPI {

    // Search users
    case searchUser(query: String)

    // List user repositories
    case listRepositoriesFor(username: String)
}

extension GithubAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com/search/")!
    }

    var path: String {
        switch self {
        case .searchUser:
            return "users"
        case .listRepositoriesFor:
            return "repositories"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        // TODO: Add sample data for tests
        return Data()
    }

    var task: Task {
        var parameters: [String: String] = [:]
        let encoding: ParameterEncoding = URLEncoding.default

        switch self {
        case .searchUser(let query):
            parameters["q"] = query
        case .listRepositoriesFor(let username):
            parameters["q"] = "user:\(username)"
        }

        return .requestParameters(parameters: parameters, encoding: encoding)
    }

    var headers: [String : String]? {
        return nil
    }
}
