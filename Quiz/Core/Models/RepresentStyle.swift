//
//  RepresentStyle.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

struct RepresentStyle: Codable, Identifiable, Equatable {
    let id: String
    let title: String
    let imageUrl: String
    
    init(id: String, title: String, imageUrl: String) {
        self.id = id
        self.title = title
        self.imageUrl = imageUrl
    }
}
