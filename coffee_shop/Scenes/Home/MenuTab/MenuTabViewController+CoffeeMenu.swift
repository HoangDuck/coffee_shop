//
//  MenuTabViewController+CoffeeMenu.swift
//  coffee_shop
//
//  Created by TE-Member on 20/02/2024.
//

import UIKit

extension MenuTabViewController{
    func addMenuCoffee() {
        addMenuCategoryCoffee()
        addMenuOptionCoffee()
    }
    
    func addMenuOptionCoffee() {
        scrollView.addSubview(coffeeOptionView)
        coffeeOptionView.translatesAutoresizingMaskIntoConstraints = false
        coffeeOptionView.topAnchor.constraint(equalTo: coffeeCategoryView.bottomAnchor, constant: 20).isActive = true
        coffeeOptionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        coffeeOptionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        coffeeOptionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
   ///COFFEE CATEGORY MENU
    func addMenuCategoryCoffee() {
        coffeeCategoryView.showsHorizontalScrollIndicator = false
        var xPosition: CGFloat = 20
        var index: Int = 0
        for item in CoffeeCategory.menuCoffeeCategories {
            let itemView = index == 0 ? selectedItemStyle(item: item,xPosition: xPosition) : unselectedItemStyle(item: item, xPosition: xPosition)
            coffeeCategoryView.addSubview(itemView)
            xPosition += itemView.frame.width + 10
            index += 1
        }
        coffeeCategoryView.contentSize = CGSize(width: xPosition, height: 38)
        scrollView.addSubview(coffeeCategoryView)
        coffeeCategoryView.translatesAutoresizingMaskIntoConstraints = false
        coffeeCategoryView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        coffeeCategoryView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        coffeeCategoryView.topAnchor.constraint(equalTo: viewPad.bottomAnchor, constant: 70).isActive = true
        coffeeCategoryView.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func selectedItemStyle(item: CoffeeCategory, xPosition: CGFloat) -> UILabel {
        let itemView = UILabel(frame: CGRect(x: xPosition, y: 0, width: 130, height: 40))
        itemView.backgroundColor = UIColor(named: "button_color")
        itemView.text = item.name
        itemView.textAlignment = .center
        itemView.textColor = .white
        itemView.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        itemView.layer.masksToBounds = true
        itemView.layer.cornerRadius = 10
        return itemView
    }
    
    func unselectedItemStyle(item: CoffeeCategory, xPosition: CGFloat) -> UILabel {
        let itemView = UILabel(frame: CGRect(x: xPosition, y: 0, width: 130, height: 40))
        itemView.backgroundColor = .white
        itemView.text = item.name
        itemView.textAlignment = .center
        itemView.textColor = .black
        itemView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        itemView.layer.masksToBounds = true
        itemView.layer.cornerRadius = 10
        return itemView
    }
}
