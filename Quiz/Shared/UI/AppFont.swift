//
//  AppFont.swift
//  Quiz
//
//  Created by Anton Kuznetsov on 31.05.2025.
//

import SwiftUI

enum AppFont {
    
    // MARK: - Font names
    enum FontName {
        static let poppinsBold = "Poppins-Bold"
        static let poppinsLight = "Poppins-Light"
        static let poppinsThin = "Poppins-Thin"
        static let poppinsMedium = "Poppins-Medium"
        static let poppinsRegular = "Poppins-Regular"
        static let poppinsSemiBold = "Poppins-SemiBold"
        
        static let kaiseiTokuminBold = "KaiseiTokumin-Bold"
        static let kaiseiTokuminExtraBold = "KaiseiTokumin-ExtraBold"
        static let kaiseiTokuminMedium = "KaiseiTokumin-Medium"
        static let kaiseiTokuminRegular = "KaiseiTokumin-Regular"
    }
    
    // MARK: - Fonts access
    static func poppinsBold(size: CGFloat) -> Font {
        .custom(FontName.poppinsBold, size: size)
    }
    static func poppinsLight(size: CGFloat) -> Font {
        .custom(FontName.poppinsLight, size: size)
    }
    static func poppinsThin(size: CGFloat) -> Font {
        .custom(FontName.poppinsThin, size: size)
    }
    static func poppinsMedium(size: CGFloat) -> Font {
        .custom(FontName.poppinsMedium, size: size)
    }
    static func poppinsRegular(size: CGFloat) -> Font {
        .custom(FontName.poppinsRegular, size: size)
    }
    static func poppinsSemiBold(size: CGFloat) -> Font {
        .custom(FontName.poppinsSemiBold, size: size)
    }
    
    static func kaiseiTokuminBold(size: CGFloat) -> Font {
        .custom(FontName.kaiseiTokuminBold, size: size)
    }
    static func kaiseiTokuminExtraBold(size: CGFloat) -> Font {
        .custom(FontName.kaiseiTokuminExtraBold, size: size)
    }
    static func kaiseiTokuminMedium(size: CGFloat) -> Font {
        .custom(FontName.kaiseiTokuminMedium, size: size)
    }
    static func kaiseiTokuminRegular(size: CGFloat) -> Font {
        .custom(FontName.kaiseiTokuminRegular, size: size)
    }
}
