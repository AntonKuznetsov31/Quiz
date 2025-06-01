//
//  QuizApp.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI
import Firebase
import ComposableArchitecture

@main
struct QuizApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @State private var isQuizStarted = false
    
    var body: some Scene {
        WindowGroup {
            QuizAppView()
        }
    }
}

enum QuizScreen: Hashable {
    case focus
    case style
    case color
}

struct QuizAppView: View {
    
    @State private var path: [QuizScreen] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            IntroScreenView(
                store: Store(
                    initialState: IntroScreenReducer.State(),
                    reducer: { IntroScreenReducer() }
                ),
                onNext: { _ in
                    path.append(.focus)
                }
            )
            .navigationDestination(for: QuizScreen.self) { screen in
                switch screen {
                case .focus:
                    StylistFocusView(
                        store: Store(
                            initialState: StylistFocusReducer.State(),
                            reducer: { StylistFocusReducer() }
                        ),
                        onNext: { path.append(.style) },
                        onBack: { path.removeLast() }
                    )
                case .style:
                    RepresentStyleView(
                        store: Store(
                            initialState: RepresentStyleReducer.State(),
                            reducer: { RepresentStyleReducer() }
                        ),
                        onNext: { path.append(.color) },
                        onBack: { path.removeLast() }
                    )
                case .color:
                    FavouriteColorView(
                        store: Store(
                            initialState: FavouriteColorReducer.State(),
                            reducer: { FavouriteColorReducer() }
                        ),
                        onComplete: { path = [] },
                        onBack: { path.removeLast() }
                    )
                }
            }
        }
    }
}
