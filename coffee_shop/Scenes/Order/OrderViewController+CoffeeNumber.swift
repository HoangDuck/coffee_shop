//
//  OrderViewController+CoffeeNumber.swift
//  coffee_shop
//
//  Created by TE-Member on 06/03/2024.
//

import UIKit

extension OrderViewController {
    func addCoffeeNumber(){
        let viewCoffeeNumber = UIView()
        viewCoffeeNumber.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
        viewCoffeeNumber.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }
}
