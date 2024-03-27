//
//  OrderCoffeeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 27/03/2024.
//

import Foundation
import UIKit

class OrderCoffeeCoordinator: NSObject,OrderViewControllerDelegate {
    
    private var navigationController: UINavigationController?
    private var coffeeData: CoffeeMenu
    weak var delegate: OrderCoffeeCoordinatorDelegate?
    private var coordinators: [NSObject] = []
    
    init(_ navigationController: UINavigationController?, coffeeData: CoffeeMenu) {
        self.navigationController = navigationController
        self.coffeeData = coffeeData
        super.init()
    }
    
    func didPopOrderViewCoffee() {
        navigationController?.popViewController(animated: true)
        coordinators.removeAll()
        self.delegate?.didPopOrderCoffeeView(self)
    }
    
    func didOrderCoffee() {
        let vc = DeliveryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func start(){
        let viewController = OrderViewController(coffee: coffeeData)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}