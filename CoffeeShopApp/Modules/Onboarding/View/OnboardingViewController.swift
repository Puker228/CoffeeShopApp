//
//  OnboardingViewController.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 18.06.2025.
//

import UIKit

class OnboardingViewController: UIViewController {
    lazy var onboardingView: UIImageView = {
        $0.image = UIImage(named: "OnboardingImg")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(onboardingView)
        
        NSLayoutConstraint.activate([
            onboardingView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
