//
//  QuizUserData+Dependency.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import Foundation
import ComposableArchitecture

struct QuizUserDefaultsService {
    var getStyleOptionID: () -> String?
    var setStyleOptionID: (String?) -> Void
    
    var getFocusOptionsIDs: () -> [String]
    var setFocusOptionsIDs: ([String]) -> Void
    
    var getColorOptionsIDs: () -> [String]
    var setColorOptionsIDs: ([String]) -> Void
    
    var clearAll: () -> Void
}

extension QuizUserDefaultsService: DependencyKey {
    static let liveValue = Self(
        getStyleOptionID: {
            UserDefaults.standard.string(forKey: "quiz.selectedStyleOptionID")
        },
        setStyleOptionID: { id in
            UserDefaults.standard.set(id, forKey: "quiz.selectedStyleOptionID")
        },
        getFocusOptionsIDs: {
            UserDefaults.standard.stringArray(forKey: "quiz.selectedFocusOptionsIDs") ?? []
        },
        setFocusOptionsIDs: { ids in
            UserDefaults.standard.set(ids, forKey: "quiz.selectedFocusOptionsIDs")
        },
        getColorOptionsIDs: {
            UserDefaults.standard.stringArray(forKey: "quiz.selectedColorOptionsIDs") ?? []
        },
        setColorOptionsIDs: { ids in
            UserDefaults.standard.set(ids, forKey: "quiz.selectedColorOptionsIDs")
        },
        clearAll: {
            UserDefaults.standard.removeObject(forKey: "quiz.selectedStyleOptionID")
            UserDefaults.standard.removeObject(forKey: "quiz.selectedFocusOptionsIDs")
            UserDefaults.standard.removeObject(forKey: "quiz.selectedColorOptionsIDs")
        }
    )
}

extension DependencyValues {
    var quizUserDefaultsService: QuizUserDefaultsService {
        get { self[QuizUserDefaultsService.self] }
        set { self[QuizUserDefaultsService.self] = newValue }
    }
}

