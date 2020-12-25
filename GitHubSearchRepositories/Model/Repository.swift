//
//  Repository.swift
//  GitHubSearchRepositories
//
//  Created by Sergey Lukaschuk on 25.12.2020.
//

import Foundation

struct Repository: Decodable {
    let node_id: String
    let fullName: String
    let description: String?
    let stargazersCount: Int
    let htmlUrl: URL
    let login: String
}

struct Results: Decodable {
    let items: [Repository]
}











