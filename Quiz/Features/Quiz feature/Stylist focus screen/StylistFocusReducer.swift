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
    }
    
    @Dependency(\.quizDataService) var quizDataService
    @Dependency(\.quizUserDefaultsService) var quizUserDefaultsService
    
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
                state.selectedOptionsIDs = quizUserDefaultsService.getFocusOptionsIDs()
                return .none
                
            case let .toggleSelection(id):
                if state.selectedOptionsIDs.contains(id) {
                    state.selectedOptionsIDs.removeAll { $0 == id }
                } else {
                    state.selectedOptionsIDs.append(id)
                }
                quizUserDefaultsService.setFocusOptionsIDs(state.selectedOptionsIDs)
                return .none
                
            case .loadError(let error):
                state.isLoading = false
                state.errorMessage = error
                return .none
                
            case .didTapContinue:
                return .none
            }
        }
    }
}
