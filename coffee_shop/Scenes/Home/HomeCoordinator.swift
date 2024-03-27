//
//  HomeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 26/03/2024.
//

import Foundation
import UIKit

class HomeCoordinator: NSObject, HomeViewControllerDelegate,DetailCoffeeCoordinatorDelegate {
    
    private var navigationController: UINavigationController?
    private var coordinators:[NSObject] = [];
    
    init(_ navigationController: UINavigationController?) {
        super.init()
        self.navigationController = navigationController
    }
    
    func didPopDetailCoffeeView(_ coordinator: DetailCoffeeCoordinator) {
        coordinators.removeLast()
    }
    
    func didSelectCoffee(coffee: CoffeeMenu) {
        let coordinator = DetailCoffeeCoordinator(self.navigationController, coffee: coffee)
        coordinator.delegate = self
        coordinator.start()
        coordinators.append(coordinator)
    }
    
    func start() -> Void {
        let homeViewController = HomeViewController()
        homeViewController.homeDelegate = self
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
