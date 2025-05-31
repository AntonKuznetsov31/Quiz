//
//  FavouriteColor.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

struct FavouriteColor: Codable, Identifiable, Equatable {
    var id: UUID { UUID() }
    let name: String
    let color: String
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}
