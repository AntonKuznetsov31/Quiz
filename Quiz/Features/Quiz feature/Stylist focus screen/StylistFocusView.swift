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
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in

            VStack(spacing: 24) {
                Text("quiz_focus_header_title")
                        .font(AppFont.poppinsBold(size: 14))
                        .padding(.top, 16)
                VStack(spacing: 16) {
                    Text("quiz_focus_main_title")
                        .font(AppFont.kaiseiTokuminRegular(size: 26))
                        .multilineTextAlignment(.leading)
                    Text("quiz_focus_subtitle")
                        .font(AppFont.poppinsThin(size: 14))
                }
                .padding(.horizontal, 16)
                
                VStack(spacing: 12) {
                    ForEach(viewStore.focusOptions) { option in
                        FocusOptionView(
                            option: option,
                            isSelected: viewStore.selectedOptionsIDs.contains(option.id),
                            onTap: {
                                viewStore.send(.toggleSelection(option.id))
                            }
                        )
                        .frame(height: 72)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                AppButton(title: "continue_button_title",
                          backgroundColor: AppColor.primaryButtonBackgroundColor,
                          foregroundColor: AppColor.darkModeTextColor) {
                    viewStore.send(.didTapContinue)
                }
                .padding(.bottom, 32)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
            
        }
    }
}

#Preview {
    StylistFocusView(store: Store(initialState: StylistFocusReducer.State(),
                                  reducer: { StylistFocusReducer() }))
}
