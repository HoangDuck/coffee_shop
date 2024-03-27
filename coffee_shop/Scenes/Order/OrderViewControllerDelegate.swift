//
//  OrderViewControllerDelegate.swift
//  coffee_shop
//
//  Created by TE-Member on 27/03/2024.
//

import Foundation

protocol OrderViewControllerDelegate: NSObject {
    func didPopOrderViewCoffee()
    func didOrderCoffee()
}
