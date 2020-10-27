//
//  SearchResult.swift
//  SwitfHub
//
//  Created by Elias Medeiros on 24/10/20.
//

import Foundation

struct SearchResult: Decodable {
    let totalCount: Int
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
