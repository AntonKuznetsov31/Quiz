//
//  FavouriteColorOptionView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI

struct FavouriteColorOptionView: View {
    
    var isSelected: Bool
    let color: FavouriteColor
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 8) {
                    Spacer()
                    
                    Rectangle()
                        .fill(Color(hex: color.color))
                        .frame(width: 32, height: 32)
                    
                    Text(color.name.uppercased())
                        .font(isSelected ? AppFont.poppinsMedium(size: 13) : AppFont.poppinsLight(size: 13))
                        .foregroundStyle(AppColor.primaryTextColor)
                    
                    Spacer()
                }
                .frame(width: 108, height: 108)
                .background(Color.white)
                .overlay(
                    Rectangle()
                        .stroke(isSelected ? .black : Color.gray.opacity(0.5), lineWidth: 1)
                )
                if isSelected {
                    Image("check_box")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(6)
                }
            }
        }
        .frame(width: 108, height: 108)
    }
}
