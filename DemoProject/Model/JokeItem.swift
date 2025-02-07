//
//  JokeItem.swift
//  DemoProject
//
//  Created by BGDV on 07.02.2025.
//

import Foundation

struct JokeItem: Decodable {
    let categories: [String]
    let createdAt: String
    let iconUrl: URL
    let id: String
    let updatedAt: String
    let url: URL
    let value: String
}
