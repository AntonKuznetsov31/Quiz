//
//  StylistFocusView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI
import ComposableArchitecture

struct StylistFocusView: View {
    
    let store: StoreOf<StylistFocusReducer>
    
    let onNext: () -> Void
    let onBack: () -> Void
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                headerView
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
        Text("quiz_focus_navigation_title")
            .font(AppFont.poppinsRegular(size: 14))
    }
    
    var headerView: some View {
        VStack(alignment: .leading) {
            Text("quiz_focus_main_title")
                .font(AppFont.kaiseiTokuminRegular(size: 26))
            Text("quiz_focus_subtitle")
                .font(AppFont.poppinsLight(size: 14))
        }
        .padding(.bottom, 24)
    }
    
    func scrollView(_ viewStore: ViewStoreOf<StylistFocusReducer>) -> some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewStore.focusOptions) { option in
                    FocusOptionView(
                        option: option,
                        isSelected: viewStore.selectedOptionsIDs.contains(option.id),
                        onTap: {
                            viewStore.send(.toggleSelection(option.id))
                        }
                    )
                }
            }
        }
        .scrollIndicators(.hidden)
        .frame(maxHeight: .infinity)
    }
    
    func continueButton(_ viewStore: ViewStoreOf<StylistFocusReducer>) -> some View {
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
