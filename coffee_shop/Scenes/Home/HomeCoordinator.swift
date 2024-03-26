//
//  HomeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 26/03/2024.
//

import Foundation
import UIKit

class HomeCoordinator: NSObject, HomeViewControllerDelegate {
    
    private var navigationController: UINavigationController?
    private var coordinators:[NSObject] = [];
    
    init(_ navigationController: UINavigationController?) {
        super.init()
        self.navigationController = navigationController
    }
    
    func didSelectCoffee(coffee: CoffeeMenu) {
        print("choose 1")
        let viewController = DetailViewController(coffee: coffee)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func start() -> Void {
        let homeViewController = HomeViewController()
        homeViewController.homeDelegate = self
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
