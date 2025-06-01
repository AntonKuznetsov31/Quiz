//
//  RepresentStyleView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI
import ComposableArchitecture

struct RepresentStyleView: View {
    
    let store: StoreOf<RepresentStyleReducer>
    
    let onNext: () -> Void
    let onBack: () -> Void
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 0) {
                mainTitle
                scrollView(viewStore)
                continueButton(viewStore)
            }
            .padding(.horizontal, 20)
            .onAppear { viewStore.send(.onAppear) }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        onBack()
                    }) {
                        Image("back_button")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 24, height: 24)
                    }
                }
                ToolbarItem(placement: .principal) {
                    navigationTitle
                }
            }
        }
    }
    
    var mainTitle: some View {
        Text("quiz_style_main_title")
            .font(AppFont.kaiseiTokuminRegular(size: 26))
            .padding(.bottom, 24)
            .multilineTextAlignment(.leading)
    }
    
    var navigationTitle: some View {
        Text("quiz_style_navigation_title")
            .font(AppFont.poppinsRegular(size: 14))
    }
    
    private func scrollView(_ viewStore: ViewStoreOf<RepresentStyleReducer>) -> some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 12),
                GridItem(.flexible(), spacing: 12)
            ], spacing: 12) {
                ForEach(viewStore.styleOptions) { style in
                    RepresentStyleOptionView(
                        isSelected: viewStore.selectedStyleID == style.id,
                        style: style,
                        onTap: {
                            viewStore.send(.selectStyle(style.id))
                        }
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxHeight: .infinity)
    }
    
    private func continueButton(_ viewStore: ViewStoreOf<RepresentStyleReducer>) -> some View {
        AppButton(
            title: "continue_button_title",
            backgroundColor: AppColor.primaryButtonBackgroundColor,
            foregroundColor: AppColor.darkModeTextColor
        ) {
            viewStore.send(.didTapContinue)
            onNext()
        }
        .padding(.bottom, 22)
    }
}
