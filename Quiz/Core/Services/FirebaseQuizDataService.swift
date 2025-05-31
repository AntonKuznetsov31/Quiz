//
//  FirebaseQuizDataService.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import FirebaseFirestore

final class FirebaseQuizDataService: QuizDataServiceProtocol {
    
    private let dataBase = Firestore.firestore()
    
    private func fetchDataFrom<T: Decodable>(_ collection: String, as type: T.Type) async throws -> [T] {
        let querySnapshot = try await dataBase.collection(collection).getDocuments()
        return try querySnapshot.documents.compactMap { queryDocument in
            try queryDocument.data(as: T.self)
        }
    }
    
    func fetchStylistFocus() async throws -> [StylistFocus] {
        try await fetchDataFrom("quiz_stylist_focus", as: StylistFocus.self)
    }
    
    func fetchStyleOptions() async throws -> [RepresentStyle] {
        try await fetchDataFrom("quiz_represent_styles", as: RepresentStyle.self)
    }
    
    func fetchColorOptions() async throws -> [FavouriteColor] {
        try await fetchDataFrom("quiz_favourite_colors", as: FavouriteColor.self)
    }
}
