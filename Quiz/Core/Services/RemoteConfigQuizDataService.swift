//
//  RemoteConfigQuizDataService.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation
import FirebaseRemoteConfig

final class RemoteConfigQuizDataService: QuizDataServiceProtocol {
    
    private let remoteConfig = RemoteConfig.remoteConfig()
    private var didFetch = false
    
    init() {}
    
    private func fetchRemoteConfig() async throws {
        guard !didFetch else { return }
        
        let success = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Bool, Error>) in
            RemoteConfig.remoteConfig().fetchAndActivate { status, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: true)
                }
            }
        }
        
        if success {
            didFetch = true
        }
    }
    
    private func fetchDecoded<T: Decodable>(forKey key: String) throws -> [T] {
        let json = remoteConfig.configValue(forKey: key).stringValue
        let data = Data(json.utf8)
        return try JSONDecoder().decode([T].self, from: data)
    }

    func fetchStylistFocus() async throws -> [StylistFocus] {
        try await fetchRemoteConfig()
        return try fetchDecoded(forKey: "quiz_stylist_focus")
    }

    func fetchStyleOptions() async throws -> [RepresentStyle] {
        try await fetchRemoteConfig()
        return try fetchDecoded(forKey: "quiz_represent_styles")
    }

    func fetchColorOptions() async throws -> [FavouriteColor] {
        try await fetchRemoteConfig()
        return try fetchDecoded(forKey: "quiz_favourite_colors")
    }
}
