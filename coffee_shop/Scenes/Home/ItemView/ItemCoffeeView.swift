//
//  ItemCoffeeView.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import UIKit

class ItemCoffeeView: UICollectionViewCell {
    static let identifier: String = "CoffeeItem"
    
    var imageView = UIImageView()
    let starView = UIImageView(image: UIImage(named: "rating_star"))
    var titleCoffee = UILabel()
    var descriptionCoffee = UILabel()
    var priceCoffee = UILabel()
    var rateCoffee = UILabel()
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 10
        //add image view coffee
        addSubview(imageView)
        
        
        addSubview(starView)
        addSubview(titleCoffee)
        addSubview(descriptionCoffee)
        addSubview(priceCoffee)
        addSubview(rateCoffee)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
