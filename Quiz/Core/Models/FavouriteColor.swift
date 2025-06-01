//
//  FavouriteColor.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

struct FavouriteColor: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let color: String
    
    init(id: String, name: String, color: String) {
        self.id = name
        self.name = name
        self.color = color
    }
}
