//
//  OnboardingViewController.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 18.06.2025.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Views
    
    lazy var gradientView: UIView = {
        let view = UIView()
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 0.44)
        view.layer.insertSublayer(gradient, at: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var onboardingImageView: UIImageView = {
        $0.image = UIImage(named: "OnboardingImg")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var getStartedButton: UIButton = {
        $0.setTitle("Get Started", for: .normal)
        $0.titleLabel?.font = .soraFont(fontType: SoraFont.semiBold)
        $0.backgroundColor = .coffee01
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    lazy var mainTitleLable: UILabel = createLabel(
        text: "Fall in Love with Coffee in Blissful Delight!",
        textColor: .white,
        font: .soraFont(fontType: SoraFont.semiBold, size: 32),
        kern: 0.5
    )
    
    lazy var subTitleLable: UILabel = createLabel(
        text: "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
        textColor: .coffeeSubTitle,
        font: .soraFont(fontType: SoraFont.regular, size: 14),
        kern: 1
    )
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitleLable, subTitleLable])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(onboardingImageView)
        view.addSubview(gradientView)
        view.addSubview(titleStackView)
        view.addSubview(getStartedButton)
        
        createConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let gradient = gradientView.layer.sublayers?.first as? CAGradientLayer {
            gradient.frame = gradientView.bounds
        }
    }

    
    // MARK: - UI Setup
    
    func createConstraints() {
        NSLayoutConstraint.activate([
            titleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleStackView.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -32),

            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            getStartedButton.heightAnchor.constraint(equalToConstant: 56),
            
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor, constant: 452),
            
            onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -166),
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -47),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 46),
            onboardingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -276),
        ])
    }

    
    // MARK: - Helpers
    
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
}
