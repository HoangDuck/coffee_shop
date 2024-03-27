//
//  OrderCoffeeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 27/03/2024.
//

import Foundation
import UIKit

class OrderCoffeeCoordinator: NSObject,OrderViewControllerDelegate, DeliveryCoffeeCoordinatorDelegate {
    
    private var navigationController: UINavigationController?
    private var coffeeData: CoffeeMenu
    weak var delegate: OrderCoffeeCoordinatorDelegate?
    private var coordinators: NSMutableArray = []
    
    init(_ navigationController: UINavigationController?, coffeeData: CoffeeMenu) {
        self.navigationController = navigationController
        self.coffeeData = coffeeData
        super.init()
    }
    
    func didPopOrderViewCoffee() {
        navigationController?.popViewController(animated: true)
        coordinators.removeAllObjects()
        self.delegate?.didPopOrderCoffeeView(self)
    }
    
    func didOrderCoffee() {
        let coordinator = DeliveryCoffeeCoordinator(self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        coordinators.add(coordinator)
    }
    
    func didPopDeliveryView(_ coordinator: DeliveryCoffeeCoordinator) {
        coordinators.remove(coordinator)
        self.delegate?.didPopOrderCoffeeView(self)
    }
    
    func start(){
        let viewController = OrderViewController(coffee: coffeeData)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}
