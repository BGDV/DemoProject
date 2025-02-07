//
//  ViewModel.swift
//  DemoProject
//
//  Created by BGDV on 08.02.2025.
//

import SwiftUI

@Observable
final class ViewModel {
    var httpManager: HTTPManager
    var jokeItem: JokeItem?
    
    init(httpManager: HTTPManager) {
        self.httpManager = httpManager
    }
    
    func loadJoke() async throws {
        let jokeResource = Resource(url: ApiPaths.random.path, modelType: JokeItem.self)
        jokeItem = try await httpManager.request(jokeResource)
    }
}
