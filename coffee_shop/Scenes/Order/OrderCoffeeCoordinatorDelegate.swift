//
//  OrderCoffeeCoordinatorDelegate.swift
//  coffee_shop
//
//  Created by TE-Member on 27/03/2024.
//

import Foundation

protocol OrderCoffeeCoordinatorDelegate: NSObject {
    func didPopOrderCoffeeView(_ coordinator: OrderCoffeeCoordinator)
}
