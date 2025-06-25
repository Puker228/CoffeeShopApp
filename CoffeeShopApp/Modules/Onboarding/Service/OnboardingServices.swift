//
//  OnboardingServices.swift
//  CoffeeShopApp
//
//  Created by Данил Дьяченко on 23.06.2025.
//

import UIKit

// checking whether the user has seen the onboarding screen.
class OnboardingService {
    private let key = "hasSeenOnboarding"
    
    var hasSeenOnboarding: Bool {
        UserDefaults.standard.bool(forKey: key)
    }
    
    func markAsSeen() {
        UserDefaults.standard.set(true, forKey: key)
    }
}
