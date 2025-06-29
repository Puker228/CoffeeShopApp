//
//  TopContainer.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 28.06.2025.
//

import UIKit

final class TopContainer: UIView {
    
    // MARK: - Setup
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
        setupViews()
        setupConstraints()
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
    
    private func setupViews() {
        addSubview(locationStackView)
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            locationStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            locationStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -168),
            locationStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -169),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Views
    
    lazy var locationLable: UILabel = createLabel(
        text: "Location",
        textColor: .lightGray,
        font: .soraFont(fontType: SoraFont.regular, size: 12),
        kern: 0.01
    )
    
    lazy var locationTitle: UILabel = createLabel(
        text: "Bilzen, Tanjungbalai ",
        textColor: .systemGray,
        font: .soraFont(fontType: SoraFont.semiBold, size: 14),
        kern: 0
    )
    
    // TODO: поправить отображение стрелочки
    lazy var chevronImg: UIImageView = {
        $0.image = UIImage(systemName: "chevron.compact.down")
        $0.tintColor = .systemGray
//        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            $0.widthAnchor.constraint(equalToConstant: 8),
            $0.heightAnchor.constraint(equalToConstant: 4)
        ])
        return $0
    }(UIImageView())
    
    lazy var locationTitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationTitle, chevronImg])
        stackView.axis = .horizontal
        stackView.spacing = 4
//        stackView.distribution = .equalSpacing
//        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    lazy var locationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLable, locationTitleStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
}
