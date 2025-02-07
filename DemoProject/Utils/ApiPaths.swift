//
//  ApiPaths.swift
//  DemoProject
//
//  Created by BGDV on 06.02.2025.
//

import Foundation

enum ApiPaths {
    case random
    case categories
   
    private var baseURL: URL {
        URL(string: "https://api.chucknorris.io/jokes/")!
    }
    
    var path: URL {
        switch self {
            case .random:
                return baseURL.appendingPathComponent("random")
            case .categories:
                return baseURL.appendingPathComponent("categories")
        }
    }
}
