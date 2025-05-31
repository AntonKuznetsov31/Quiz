//
//  QuizStep.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import Foundation

enum QuizStep: Equatable, CaseIterable {
    case stylistFocus
    case representStyle
    case favouriteColors
    
    var next: QuizStep? {
        let allSteps = QuizStep.allCases
        guard let index = allSteps.firstIndex(of: self),
              index + 1 < allSteps.count else {
            return nil
        }
        return allSteps[index + 1]
    }
}
