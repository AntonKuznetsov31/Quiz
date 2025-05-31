//
//  StylistFocusReducer.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct StylistFocusReducer: Reducer {
    
    struct State: Equatable {
        var currentStep: QuizStep = .stylistFocus
        var goToNextStep: Bool = false
        var focusOptions: [StylistFocus] = []
        var selectedOptionsIDs: [String] = []
        var isLoading = false
        var errorMessage: String?
    }
    
    enum Action: Equatable {
        case onAppear
        case dataLoaded([StylistFocus])
        case loadError(String)
        case toggleSelection(String)
        case didTapContinue
        case setGoToNextStep(isActive: Bool)
    }
    
    @Dependency(\.quizDataService) var quizDataService
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .onAppear:
                state.isLoading = true
                return .run { send in
                    do {
                        let result = try await quizDataService.fetchStylistFocus()
                        await send(.dataLoaded(result))
                    } catch {
                        await send(.loadError(error.localizedDescription))
                    }
                }
                
            case .dataLoaded(let data):
                state.isLoading = false
                state.focusOptions = data
                state.errorMessage = nil
                return .none
                
            case let .toggleSelection(id):
                if state.selectedOptionsIDs.contains(id) {
                    state.selectedOptionsIDs.removeAll { $0 == id }
                } else {
                    state.selectedOptionsIDs.append(id)
                }
                return .none
                
            case .loadError(let errorMessage):
                state.isLoading = false
                state.errorMessage = errorMessage
                return .none
            
            case .didTapContinue:
                state.goToNextStep = true
                return .none
                
            case let .setGoToNextStep(isActive):
                state.goToNextStep = isActive
                return .none
            }
        }
    }
}
