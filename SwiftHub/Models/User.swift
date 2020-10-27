//
//  User.swift
//  SwitfHub
//
//  Created by Elias Medeiros on 24/10/20.
//

import Foundation

struct User: Decodable {
    let name: String
    let bio: String
    let pictureURL: String
    let profileURL: String
    let email: String?
    let blog: String?
    let followers: Int
    let following: Int
    let repos: Int

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case bio
        case pictureURL = "avatar_url"
        case profileURL = "url"
        case email
        case blog
        case followers
        case following
        case repos = "public_repos"
    }
}
