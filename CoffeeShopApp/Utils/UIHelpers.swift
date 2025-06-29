//
//  UIHelpers.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 29.06.2025.
//

import UIKit

func createLabel(text: String, textColor: UIColor, font: UIFont, kern: CGFloat) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = font
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = textColor
    label.textAlignment = .center
    label.numberOfLines = 0
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .center
    paragraphStyle.lineSpacing = 6

    let attributedString = NSAttributedString(
        string: text,
        attributes: [
            .paragraphStyle: paragraphStyle,
            .kern: kern,
            .font: font
        ]
    )
    
    label.attributedText = attributedString
    return label
}
