//
//  ItemCoffeeView.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import UIKit

class ItemCoffeeView: UICollectionViewCell {
    static let identifier: String = "CoffeeItem"
    
    let viewBackgroundRating = UIView()
    let viewButtonAdd = UIButton()
    
    var imageView = UIImageView()
    let starView = UIImageView(image: UIImage(named: "rating_star"))
    var titleCoffee = UILabel()
    var descriptionCoffee = UILabel()
    var priceCoffee = UILabel()
    var rateCoffee = UILabel()
    
    func setupUI() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 20
        setupImageCoffee()
        setupTitleCoffee()
        setupDescriptionCoffee()
        setupPriceCoffee()
        setupRatingCoffee()
        setupUIButtonAdd()
    }
    
    func setupImageCoffee(){
        //add image view coffee
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupTitleCoffee(){
        //add title coffee
        addSubview(titleCoffee)
        titleCoffee.translatesAutoresizingMaskIntoConstraints = false
        titleCoffee.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleCoffee.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupDescriptionCoffee(){
        addSubview(descriptionCoffee)
        descriptionCoffee.translatesAutoresizingMaskIntoConstraints = false
        descriptionCoffee.topAnchor.constraint(equalTo: titleCoffee.bottomAnchor, constant: 5).isActive = true
        descriptionCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        descriptionCoffee.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupPriceCoffee() {
        addSubview(priceCoffee)
        priceCoffee.translatesAutoresizingMaskIntoConstraints = false
        priceCoffee.topAnchor.constraint(equalTo: descriptionCoffee.bottomAnchor, constant: 10).isActive = true
        priceCoffee.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        priceCoffee.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    func setupRatingCoffee(){
        viewBackgroundRating.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        viewBackgroundRating.layer.masksToBounds = true
        viewBackgroundRating.layer.cornerRadius = 20
        viewBackgroundRating.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        addSubview(viewBackgroundRating)
        viewBackgroundRating.translatesAutoresizingMaskIntoConstraints = false
        viewBackgroundRating.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
        viewBackgroundRating.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
        viewBackgroundRating.heightAnchor.constraint(equalToConstant: 27).isActive = true
        viewBackgroundRating.widthAnchor.constraint(equalToConstant: 55).isActive = true
        viewBackgroundRating.addSubview(starView)
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.leadingAnchor.constraint(equalTo: viewBackgroundRating.leadingAnchor, constant: 10).isActive = true
        starView.topAnchor.constraint(equalTo: viewBackgroundRating.topAnchor, constant: 8).isActive = true
        viewBackgroundRating.addSubview(rateCoffee)
        rateCoffee.translatesAutoresizingMaskIntoConstraints = false
        rateCoffee.centerYAnchor.constraint(equalTo: starView.centerYAnchor).isActive = true
        rateCoffee.leadingAnchor.constraint(equalTo: starView.trailingAnchor, constant: 5).isActive = true
    }
    
    func setupUIButtonAdd() {
        viewButtonAdd.backgroundColor = UIColor(named: "button_color")
        viewButtonAdd.tintColor = .white
        viewButtonAdd.setImage(UIImage(systemName: "plus"), for: .normal)
        viewButtonAdd.layer.cornerRadius = 15
        addSubview(viewButtonAdd)
        viewButtonAdd.translatesAutoresizingMaskIntoConstraints = false
        viewButtonAdd.centerYAnchor.constraint(equalTo: priceCoffee.centerYAnchor).isActive = true
        viewButtonAdd.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        viewButtonAdd.heightAnchor.constraint(equalToConstant: 40).isActive = true
        viewButtonAdd.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
