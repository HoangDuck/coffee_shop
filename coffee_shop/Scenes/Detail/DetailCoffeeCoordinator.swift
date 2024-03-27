//
//  DetailCoffeeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 26/03/2024.
//

import Foundation
import UIKit

class DetailCoffeeCoordinator: NSObject,DetailViewControllerDelegate, OrderCoffeeCoordinatorDelegate {
    
    private var navigationController: UINavigationController?
    private var coffeeData: CoffeeMenu
    weak var delegate: DetailCoffeeCoordinatorDelegate?
    private var coordinators: [NSObject] = []
    
    init(_ navigationController: UINavigationController?, coffee: CoffeeMenu) {
        self.navigationController = navigationController
        self.coffeeData = coffee
        super.init()
    }
    
    func didPopOrderCoffeeView(_ coordinator: OrderCoffeeCoordinator) {
        coordinators.removeLast()
        self.delegate?.didPopDetailCoffeeView(self)
    }
    
    func didBuyNowCoffee() {
        let coordinator = OrderCoffeeCoordinator(self.navigationController, coffeeData: coffeeData)
        coordinator.delegate = self
        coordinator.start()
        coordinators.append(coordinator)
    }
    
    func didPopDetailView() {
        navigationController?.popViewController(animated: true)
        self.coordinators.removeAll()
        self.delegate?.didPopDetailCoffeeView(self)
    }
    
    func start(){
        let viewController = DetailViewController(coffee: self.coffeeData)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}
