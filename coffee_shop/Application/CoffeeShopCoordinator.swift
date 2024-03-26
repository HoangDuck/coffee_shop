//
//  CoffeeShopCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 26/03/2024.
//

import Foundation
import UIKit

class CoffeeShopCoordinator: NSObject,OnboardViewControllerDelegate {
    
    private let navigationController: UINavigationController = UINavigationController()
    
    func navigateToHome() {
        print("Calllll")
        let homeVC = HomeViewController()
        navigationController.pushViewController(homeVC, animated: true)
    }
}
