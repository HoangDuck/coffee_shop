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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoffeeItem", for: indexPath) as! ItemCoffeeView
        let coffeeItem = coffees[indexPath.row]
        //image coffee
        cell.imageView = UIImageView(image: coffeeItem.imageMenu)
        //title coffee
        cell.titleCoffee.text = coffeeItem.title
        cell.titleCoffee.textColor = .black
        cell.titleCoffee.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //description coffee
        cell.descriptionCoffee.text = coffeeItem.notes
        cell.descriptionCoffee.textColor = UIColor(named: "description_coffee")
        cell.descriptionCoffee.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        //price coffee
        cell.priceCoffee.text = coffeeItem.price
        cell.priceCoffee.textColor = .black
        cell.priceCoffee.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //star rating coffee
        cell.rateCoffee.text = coffeeItem.ratings
        cell.rateCoffee.textColor = .white
        cell.rateCoffee.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
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
        self.register(ItemCoffeeView.self, forCellWithReuseIdentifier: "CoffeeItem")
        self.dataSource = self
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
