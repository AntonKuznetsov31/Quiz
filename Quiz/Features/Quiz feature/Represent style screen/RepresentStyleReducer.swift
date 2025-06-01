//
//  RepresentStyleReducer.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI
import ComposableArchitecture

struct RepresentStyleReducer: Reducer {
    
    struct State: Equatable {
        var styleOptions: [RepresentStyle] = []
        var selectedStyleID: String? = nil
        var isLoading = false
        var errorMessage: String? = nil
    }
    
    enum Action: Equatable {
        case onAppear
        case dataLoaded([RepresentStyle])
        case loadError(String)
        case selectStyle(String)
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
                        let styles = try await quizDataService.fetchStyleOptions()
                        await send(.dataLoaded(styles))
                    } catch {
                        await send(.loadError(error.localizedDescription))
                    }
                }
                
            case let .dataLoaded(styles):
                state.isLoading = false
                state.styleOptions = styles
                state.selectedStyleID = quizUserDefaultsService.getStyleOptionID()
                return .none
                
            case let .loadError(error):
                state.isLoading = false
                state.errorMessage = error
                return .none
                
            case let .selectStyle(id):
                state.selectedStyleID = id
                quizUserDefaultsService.setStyleOptionID(id)
                return .none
                
            case .didTapContinue:
                return .none
            }
        }
    }
}
