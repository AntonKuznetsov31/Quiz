//
//  FocusOptionView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI

struct FocusOptionView: View {
    let option: StylistFocus
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading, spacing: 1) {
                    Text(option.title.uppercased())
                        .font(AppFont.poppinsSemiBold(size: 13))
                    Text(option.description)
                        .font(AppFont.poppinsLight(size: 14))
                }
                .foregroundStyle(AppColor.primaryTextColor)
                
                Spacer()
                
                Image(isSelected ? "check_box" : "сheck_box_empty")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding()
            .overlay(
                Rectangle()
                    .stroke(Color.gray.opacity(isSelected ? 1 : 0.4), lineWidth: 1)
            )
        }
    }
}
