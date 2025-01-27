//
//  Item.swift
//  DemoProject
//
//  Created by BGDV on 27.01.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
    
    static let `default`: Item = .init(timestamp: Date())
}
