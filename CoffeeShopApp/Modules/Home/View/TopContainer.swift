//
//  TopContainer.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 28.06.2025.
//

import UIKit

final class TopContainer: UIView {
    
    // MARK: - Setup gradient
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient() {
        gradientLayer.colors = [
            UIColor(red: 17/255, green: 17/255, blue: 17/255, alpha: 1).cgColor,
            UIColor(red: 49/255, green: 49/255, blue: 49/255, alpha: 1).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Views
    
    
}
