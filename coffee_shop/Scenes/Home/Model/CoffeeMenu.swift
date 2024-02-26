//
//  CoffeeMenu.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import UIKit

struct CoffeeMenu: Equatable, Identifiable {
    var id: String = UUID().uuidString
    let imageMenu: UIImage
    let ratings: String
    let title: String
    let description: String
    let price: String
}

extension CoffeeMenu {
    static let mockMenu: [CoffeeMenu] = [
        CoffeeMenu(imageMenu: UIImage(named: "coffee_1")!, ratings: "4.8", title: "Cappucino", description: "with Chocolate", price: "$ 4.53"),
        CoffeeMenu(imageMenu: UIImage(named: "coffee_2")!, ratings: "4.9", title: "Cappucino", description: "with Oat Milk", price: "$ 3.90"),
        CoffeeMenu(imageMenu: UIImage(named: "coffee_3")!, ratings: "4.5", title: "Cappucino", description: "with Chocolate", price: "$ 4.53"),
        CoffeeMenu(imageMenu: UIImage(named: "coffee_4")!, ratings: "4.0", title: "Cappucino", description: "with Oat Milk", price: "$ 3.90")
    ]
}
