//
//  AppButton.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI

struct AppButton: View {
    let title: String
    var backgroundColor: Color = AppColor.darkModeButtonBackgroundColor
    var foregroundColor: Color = AppColor.primaryTextColor
    var font: Font = AppFont.poppinsBold(size: 14)
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(LocalizedStringKey(title))
                .font(font)
                .foregroundStyle(foregroundColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
        }
        .padding(.horizontal)
    }
}
