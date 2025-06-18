//
//  OnboardingViewController.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 18.06.2025.
//

import UIKit

class OnboardingViewController: UIViewController {
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
    
    lazy var mainTitleLable: UILabel = createLabel(text: "Fall in Love with Coffee in Blissful Delight!", size: 36, weight: .bold, textColor: .white)
    
    lazy var subTitleLable: UILabel = createLabel(text: "Welcome to our cozy coffee corner, where every cup is a delightful for you.", size: 18, weight: .regular, textColor: .coffeeSubTitle)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        view.addSubview(onboardingImageView)
        view.addSubview(mainTitleLable)
        view.addSubview(subTitleLable)
        view.addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            mainTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            mainTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            mainTitleLable.bottomAnchor.constraint(equalTo: subTitleLable.topAnchor, constant: -4),
            
            subTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            subTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            subTitleLable.topAnchor.constraint(equalTo: mainTitleLable.bottomAnchor, constant: 4),
            subTitleLable.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -20),
            
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            getStartedButton.topAnchor.constraint(equalTo: subTitleLable.bottomAnchor, constant: 20),
            getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -54),
            getStartedButton.heightAnchor.constraint(equalToConstant: 56),
            
            onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -166),
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -47),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 46),
            onboardingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -276),
        ])
    }
    
    func createLabel(text: String, size: Int, weight: UIFont.Weight, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
}
