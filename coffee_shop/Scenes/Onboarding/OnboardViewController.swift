//
//  OnboardViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class OnboardViewController: UIViewController {
    
    @IBOutlet weak private var getStartedButton: UIButton!
    
    
    @IBAction func handleGetStarted() {
        let homeVC = HomeViewController()
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
