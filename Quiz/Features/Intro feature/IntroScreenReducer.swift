//
//  IntroScreenReducer.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import ComposableArchitecture

struct IntroScreenReducer: Reducer {
    
    struct State: Equatable {
        var isQuizStarted: Bool = false
    }
    
    enum Action: Equatable {
        case didTapActionButton
        case setQuizStart(Bool)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .didTapActionButton:
                state.isQuizStarted = true
                return .none
            case .setQuizStart(let status):
                state.isQuizStarted = status
                return .none
            }
        }
    }
}
