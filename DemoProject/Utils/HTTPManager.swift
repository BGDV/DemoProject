//
//  HTTPManager.swift
//  DemoProject
//
//  Created by BGDV on 06.02.2025.
//

import SwiftUI

enum HTTPMethods {
    case get([URLQueryItem])
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

struct Resource<T: Decodable> {
    let url: URL
    var method: HTTPMethods = .get([])
    var modelType: T.Type
}


final class HTTPManager {
    private var session: URLSession

    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    
    init() {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .iso8601
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        self.session = URLSession(configuration: configuration)
    }
    
    func request<T: Decodable>(_ resource: Resource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.method.name

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError(response.description)
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            let error = try jsonDecoder.decode(ErrorModel.self, from: data)
            throw NetworkError.httpError(httpResponse.statusCode, error.message ?? "", resource.url.lastPathComponent)
        }
        
        do {
            let result = try jsonDecoder.decode(resource.modelType, from: data)
            return result
        } catch {
            throw NetworkError.decodingError(error, resource.url.lastPathComponent)
        }
    }
}

