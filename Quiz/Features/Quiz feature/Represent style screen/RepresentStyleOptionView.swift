//
//  RepresentStyleOptionView.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 01.06.2025.
//

import SwiftUI

struct RepresentStyleOptionView: View {
    
    var isSelected: Bool
    let style: RepresentStyle
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(spacing: 8) {
                AppAsyncImage(url: URL(string: style.imageUrl))
                
                Text(style.title.uppercased())
                    .font(isSelected ? AppFont.poppinsMedium(size: 13) : AppFont.poppinsLight(size: 13))
                    .foregroundStyle(AppColor.primaryTextColor)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                ZStack(alignment: .topTrailing) {
                    Rectangle()
                        .stroke(isSelected ? Color.black : Color.gray.opacity(0.5), lineWidth: 1)
                    Image(isSelected ? "check_box" : "check_box_empty")
                        .padding(8)
                }
            )
        }
    }
}
