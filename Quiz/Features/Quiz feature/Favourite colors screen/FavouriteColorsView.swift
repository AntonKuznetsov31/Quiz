//
//  FavouriteColorsView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI
import ComposableArchitecture

struct FavouriteColorView: View {
    
    let store: StoreOf<FavouriteColorReducer>
    
    let onComplete: () -> Void
    let onBack: () -> Void
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                mainTitle
                scrollView(viewStore)
                continueButton(viewStore)
            }
            .padding(.horizontal, 20)
            .onAppear {
                viewStore.send(.onAppear)
            }
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
    
    var navigationTitle: some View {
        Text("quiz_style_navigation_title")
            .font(AppFont.poppinsRegular(size: 14))
    }
    
    var mainTitle: some View {
        Text("quiz_colors_main_title")
            .font(AppFont.kaiseiTokuminRegular(size: 26))
            .padding(.bottom, 24)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func scrollView(_ viewStore: ViewStoreOf<FavouriteColorReducer>) -> some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.fixed(108), spacing: 12),
                GridItem(.fixed(108), spacing: 12),
                GridItem(.fixed(108), spacing: 12)
            ], spacing: 12) {
                ForEach(viewStore.colorOptions) { color in
                    FavouriteColorOptionView(
                        isSelected: viewStore.selectedColorIDs.contains(color.id),
                        color: color,
                        onTap: {
                            viewStore.send(.toggleColor(color.id))
                        }
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxHeight: .infinity)
    }
    
    private func continueButton(_ viewStore: ViewStoreOf<FavouriteColorReducer>) -> some View {
        AppButton(
            title: "continue_button_title",
            backgroundColor: AppColor.primaryButtonBackgroundColor,
            foregroundColor: AppColor.darkModeTextColor
        ) {
            // TODO: - add destination
        }
        .padding(.bottom, 22)
    }
}
