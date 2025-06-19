//
//  FontProvider.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 19.06.2025.
//

import UIKit


enum SoraFont: String {
    case regular = "Sora-Regular"
    case thin = "Sora-Regular_Thin"
    case extraLight = "Sora-Regular_ExtraLight"
    case light = "Sora-Regular_Light"
    case semiBold = "Sora-Regular_SemiBold"
    case bold = "Sora-Regular_Bold"
    case extraBold = "Sora-Regular_ExtraBold"
}


extension UIFont {
    static func soraFont(fontType: SoraFont = .regular, size: CGFloat = 16) -> UIFont {
        .init(name: fontType.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
