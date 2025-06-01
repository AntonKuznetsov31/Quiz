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
    
    var onNext: (QuizScreen) -> Void
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack(alignment: .bottom) {
                backgroundImage
                gradientView
                textAndButtonStack {
                    onNext(.focus)
                }
            }
        }
    }
    
    private var backgroundImage: some View {
        AppImage.welcomeBackground
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    private var gradientView: some View {
        VStack(spacing: 0) {
            Spacer()
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
                .frame(maxHeight: 800)
            Color.black.frame(height: 100)
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    private func textAndButtonStack(action: @escaping () -> Void) -> some View {
        VStack(spacing: 61) {
            Text("welcome_main_title")
                .font(AppFont.kaiseiTokuminRegular(size: 32))
                .foregroundStyle(AppColor.darkModeTextColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            AppButton(title: "welcome_button_title", action: action)
                .padding(.horizontal, 20)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 28)
    }
}
