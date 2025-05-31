//
//  IntroScreenView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct IntroScreenView: View {
    
    let store: StoreOf<IntroScreenReducer>
    
    @State private var showQuizSheet = false
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { store in
            ZStack(alignment: .bottom) {
                backgroundImage
                gradientView
                textAndButtonStack
            }
            .onChange(of: store.isQuizStarted) { newValue in
                if newValue {
                    showQuizSheet = true
                }
            }
            .fullScreenCover(isPresented: $showQuizSheet) {
                StylistFocusView(
                    store: Store(
                        initialState: StylistFocusReducer.State(),
                        reducer: { StylistFocusReducer() }
                    )
                )
            }
        }
    }
    
    var backgroundImage: some View {
        AppImage.welcomeBackground
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    var gradientView: some View {
        VStack(spacing: 0) {
            Spacer()
            LinearGradient(
                colors: [.clear, Color.black.opacity(1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(maxHeight: 800)
            Color.black
                .frame(height: 100)
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    var textAndButtonStack: some View {
        VStack(spacing: 61) {
            Text("welcome_main_title")
                .font(AppFont.kaiseiTokuminRegular(size: 32))
                .foregroundStyle(AppColor.darkModeTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            AppButton.init(title: "welcome_button_title") {
                store.send(.didTapActionButton)
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 28)
    }
}

#Preview {
    IntroScreenView(store: Store(initialState: IntroScreenReducer.State(),
                                 reducer: { IntroScreenReducer() }))
}
