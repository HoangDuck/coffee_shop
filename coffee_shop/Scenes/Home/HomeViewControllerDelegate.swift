//
//  HomeViewControllerDelegate.swift
//  coffee_shop
//
//  Created by TE-Member on 26/03/2024.
//

import Foundation

protocol HomeViewControllerDelegate: NSObject {
    func didSelectCoffee(coffee :CoffeeMenu)
    func didAppearTabOne(viewController: MenuTabViewController)
}
