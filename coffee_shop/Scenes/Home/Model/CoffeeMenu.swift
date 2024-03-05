//
//  CoffeeMenu.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import UIKit

struct CoffeeMenu {
    let imageMenu: UIImage
    let ratings: String
    let title: String
    let notes: String
    let price: String
    let description: String
    var numberRatings: String = "0"
    let listSizes: [String] = ["S","M","L"]
    
}

extension CoffeeMenu {
    static let mockMenu: [CoffeeMenu] = [
        CoffeeMenu(imageMenu: UIImage(named: "coffee_1")!, ratings: "4.8", title: "Cappucino", notes: "with Chocolate", price: "$ 4.53",description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..",numberRatings: "230"),
        CoffeeMenu(imageMenu: UIImage(named: "coffee_2")!, ratings: "4.9", title: "Cappucino", notes: "with Oat Milk", price: "$ 3.90",description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..",numberRatings: "230"),
        CoffeeMenu(imageMenu: UIImage(named: "coffee_3")!, ratings: "4.5", title: "Cappucino", notes: "with Chocolate", price: "$ 4.53",description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..",numberRatings: "230"),
        CoffeeMenu(imageMenu: UIImage(named: "coffee_4")!, ratings: "4.0", title: "Cappucino", notes: "with Oat Milk", price: "$ 3.90",description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..",numberRatings: "230")
    ]
}
