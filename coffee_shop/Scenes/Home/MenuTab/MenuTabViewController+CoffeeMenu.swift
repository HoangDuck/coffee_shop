//
//  MenuTabViewController+CoffeeMenu.swift
//  coffee_shop
//
//  Created by TE-Member on 20/02/2024.
//

import UIKit

extension MenuTabViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, CoffeeMenu.ID>
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, CoffeeMenu.ID>
    
    func addMenuCoffee() {
        addMenuCategoryCoffee()
        addCoffeeOption()
    }
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: CoffeeMenu.ID) {
        var contentConfiguration = ItemCoffeeView.Configuration()
        guard let tempItemIndex = CoffeeMenu.mockMenu.firstIndex(where: {
            element in
            element.id == id
        }) else {
            fatalError()
        }
        let tempItem = CoffeeMenu.mockMenu[tempItemIndex]
        contentConfiguration.imageCoffee = tempItem.imageMenu
        contentConfiguration.priceCoffee = tempItem.price
        contentConfiguration.descriptionCoffee = tempItem.description
        contentConfiguration.ratingStar = tempItem.ratings
        contentConfiguration.titleCoffee = tempItem.title
        cell.contentConfiguration = contentConfiguration
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
    }
    
    func addCoffeeOption() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 149, height: 239)
        coffeeOptionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: coffeeOptionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: CoffeeMenu.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        coffeeOptionView.dataSource = dataSource
        coffeeOptionView.backgroundColor = .clear
        coffeeOptionView.register(ItemCoffeeView.self, forCellWithReuseIdentifier: "CoffeeItem")
        scrollView.addSubview(coffeeOptionView)
        coffeeOptionView.translatesAutoresizingMaskIntoConstraints = false
        coffeeOptionView.topAnchor.constraint(equalTo: coffeeCategoryView.bottomAnchor, constant: 20).isActive = true
        coffeeOptionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        coffeeOptionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        updateSnapshot()
    }
    
    func updateSnapshot(reloading ids: [CoffeeMenu.ID] = []) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(CoffeeMenu.mockMenu.map { $0.id })
        if !ids.isEmpty {
            snapshot.reloadItems(ids)
        }
        dataSource.apply(snapshot)
    }
    
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
