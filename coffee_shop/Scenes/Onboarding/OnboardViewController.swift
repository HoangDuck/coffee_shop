//
//  OnboardViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class OnboardViewController: UIViewController {
    
    var delegate: OnboardViewControllerDelegate? = rootCoordinator//BAD CODE
    
    @IBOutlet weak private var getStartedButton: UIButton!
    
    @IBAction func handleGetStarted() {
        self.delegate?.getStartedViewHome()
    }
    
}
