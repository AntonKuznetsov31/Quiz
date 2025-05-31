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
            NavigationStack {
                if isQuizStarted {
                    StylistFocusView(store: Store(initialState: StylistFocusReducer.State(),
                                     reducer: { StylistFocusReducer() }))
                } else {
                    IntroScreenView(store: Store(initialState: IntroScreenReducer.State(),
                                                 reducer: { IntroScreenReducer() }))
                }
            }
        }
    }
}
