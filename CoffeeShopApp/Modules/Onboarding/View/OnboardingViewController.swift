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
    
    lazy var mainTitleLable: UILabel = createLabel(text: "Fall in Love with Coffee in Blissful Delight!", size: 36, weight: .bold)
    
    lazy var subTitleLable: UILabel = createLabel(text: "Welcome to our cozy coffee corner, where every cup is a delightful for you.", size: 18, weight: .regular)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(onboardingImageView)
        view.addSubview(mainTitleLable)
        view.addSubview(subTitleLable)
        
        NSLayoutConstraint.activate([
            mainTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainTitleLable.bottomAnchor.constraint(equalTo: subTitleLable.topAnchor, constant: -10),
            
            subTitleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subTitleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            subTitleLable.topAnchor.constraint(equalTo: mainTitleLable.bottomAnchor, constant: 8),
            subTitleLable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            onboardingImageView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func createLabel(text: String, size: Int, weight: UIFont.Weight) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
}
