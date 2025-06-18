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
        gradient.endPoint = CGPoint(x: 0, y: 0.24)
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
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.backgroundColor = .coffee01
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton())
    
    lazy var mainTitleLable: UILabel = createLabel(text: "Fall in Love with Coffee in Blissful Delight!", size: 32, weight: .semibold, textColor: .white)
    
    lazy var subTitleLable: UILabel = createLabel(text: "Welcome to our cozy coffee corner, where every cup is a delightful for you.", size: 14, weight: .regular, textColor: .coffeeSubTitle)
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [mainTitleLable, subTitleLable])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(onboardingImageView)
        view.addSubview(gradientView)
//        view.addSubview(mainTitleLable)
//        view.addSubview(subTitleLable)
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
//            mainTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            mainTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            mainTitleLable.topAnchor.constraint(equalTo: gradientView.topAnchor, constant: 24),
//            mainTitleLable.bottomAnchor.constraint(equalTo: gradientView.bottomAnchor, constant: -192),
//            
//            subTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
//            subTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
//            subTitleLable.topAnchor.constraint(equalTo: mainTitleLable.bottomAnchor, constant: 8),
//            subTitleLable.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -32),
            
            titleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleStackView.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -32),
            
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54),
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
    
    func createLabel(text: String, size: Int, weight: UIFont.Weight, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.5
        paragraphStyle.alignment = .center

        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .paragraphStyle: paragraphStyle,
                .font: UIFont.systemFont(ofSize: CGFloat(size), weight: weight),
                .kern: 0.5
            ]
        )
        
        label.attributedText = attributedString
        return label
    }
}
