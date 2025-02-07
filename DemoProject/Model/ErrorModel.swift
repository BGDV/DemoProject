//
//  ErrorModel.swift
//  DemoProject
//
//  Created by BGDV on 06.02.2025.
//

import Foundation

struct ErrorModel: Decodable {
    var code: Int?
    var message: String?
    var errors: [String: String]?
}

