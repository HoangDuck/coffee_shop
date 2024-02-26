//
//  CoffeeCategory.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import Foundation

struct CoffeeCategory {
    let id:String
    let name: String
}

extension CoffeeCategory {
    static let menuCoffeeCategories: [CoffeeCategory] = [
        CoffeeCategory(id: "1", name: "Cappucino"),
        CoffeeCategory(id: "2", name: "Machiato"),
        CoffeeCategory(id: "3", name: "Latte"),
        CoffeeCategory(id: "4", name: "Americanno")
    ]
}
