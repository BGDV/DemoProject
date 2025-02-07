//
//  NetworkError.swift
//  DemoProject
//
//  Created by BGDV on 06.02.2025.
//

import Foundation

enum NetworkError: Error {
    case requestError(String)
    case serverError(String)
    case decodingError(Error, String)
    case responseError(String)
    case urlError
    case httpError(Int, String, String)
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
            case .requestError(let lastPathComponent):
                return NSLocalizedString("Request error, path: {...}\(lastPathComponent)", comment: "Request error")
            case .serverError(let errorMessage):
                return NSLocalizedString("Server error: \(errorMessage)", comment: "Server error")
            case .decodingError(let error, let lastPathComponent):
                return NSLocalizedString("Decoding error: \(error) | path: {...}\(lastPathComponent)", comment: "Decoding error")
            case .responseError(let response):
                return NSLocalizedString("Response error: \(response)", comment: "Response error")
            case .urlError:
                return NSLocalizedString("URL error", comment: "URL error")
            case .httpError(let error, let message, let lastPathComponent):
            return NSLocalizedString("HTTP error code: \(error) | message: \(message) | last path: {...}\(lastPathComponent)", comment: "HTTP error")
        }
    }
    
}
