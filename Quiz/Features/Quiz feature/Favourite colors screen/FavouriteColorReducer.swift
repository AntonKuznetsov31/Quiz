//
//  FavouriteColorReducer.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI
import ComposableArchitecture

struct FavouriteColorReducer: Reducer {
    
    struct State: Equatable {
        var colorOptions: [FavouriteColor] = []
        var selectedColorIDs: [String] = []
        var isLoading = false
        var errorMessage: String? = nil
    }
    
    enum Action: Equatable {
        case onAppear
        case dataLoaded([FavouriteColor])
        case loadError(String)
        case toggleColor(String)
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
                        let result = try await quizDataService.fetchColorOptions()
                        await send(.dataLoaded(result))
                    } catch {
                        await send(.loadError(error.localizedDescription))
                    }
                }
                
            case let .dataLoaded(colors):
                state.isLoading = false
                state.colorOptions = colors
                state.selectedColorIDs = quizUserDefaultsService.getColorOptionsIDs()
                return .none
                
            case let .loadError(error):
                state.isLoading = false
                state.errorMessage = error
                return .none
                
            case let .toggleColor(id):
                if state.selectedColorIDs.contains(id) {
                    state.selectedColorIDs.removeAll { $0 == id }
                } else {
                    state.selectedColorIDs.append(id)
                }
                quizUserDefaultsService.setColorOptionsIDs(Array(state.selectedColorIDs))
                return .none
            }
        }
    }
}
