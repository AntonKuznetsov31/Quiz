//
//  StylistFocus.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

struct StylistFocus: Codable, Identifiable, Equatable {
    let id: String
    let title: String
    let description: String
    
    init(id: String, title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
