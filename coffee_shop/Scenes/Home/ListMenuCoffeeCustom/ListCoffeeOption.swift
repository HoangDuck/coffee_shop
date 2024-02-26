//
//  ListCoffeeOption.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import UIKit

class ListCoffeeOption: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var coffees: [CoffeeMenu] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coffees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeItem", for: indexPath)
        var contentConfiguration = ItemCoffeeView.Configuration()
        let itemContentData = coffees[indexPath.row]
        contentConfiguration.imageCoffee = itemContentData.imageMenu
        contentConfiguration.descriptionCoffee = itemContentData.description
        contentConfiguration.priceCoffee = itemContentData.price
        contentConfiguration.ratingStar = itemContentData.ratings
        contentConfiguration.titleCoffee = itemContentData.title
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 149, height: 239)
    }
    
    init(coffees: [CoffeeMenu]) {
        self.coffees = coffees
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        self.register(ItemCoffeeView.self, forCellWithReuseIdentifier: "CoffeeItem")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
