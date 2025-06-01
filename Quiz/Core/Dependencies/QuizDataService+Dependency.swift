//
//  QuizDataService+Dependency.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import ComposableArchitecture

enum QuizDataServiceKey: DependencyKey {
    static let liveValue: QuizDataServiceProtocol = RemoteConfigQuizDataService()
}

extension DependencyValues {
    var quizDataService: QuizDataServiceProtocol {
        get { self[QuizDataServiceKey.self] }
        set { self[QuizDataServiceKey.self] = newValue }
    }
}

