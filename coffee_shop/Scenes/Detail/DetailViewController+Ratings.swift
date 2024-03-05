//
//  DetailViewController+Ratings.swift
//  coffee_shop
//
//  Created by TE-Member on 05/03/2024.
//

import UIKit

extension DetailViewController {
    func addRatingCoffee() {
        let ratingView = UIView()
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        let width = scrollView.frame.width
        ratingView.widthAnchor.constraint(equalToConstant: width).isActive = true
        ratingView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        //configure star rating view
        let imageStarView = UIImageView(image: UIImage(named: "rating_star"))
        imageStarView.frame = CGRect(x: 0, y: 0, width: 17, height: 17)
        imageStarView.translatesAutoresizingMaskIntoConstraints = false
        imageStarView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        imageStarView.heightAnchor.constraint(equalToConstant: 17).isActive = true
        ratingView.addSubview(imageStarView)
        imageStarView.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor).isActive = true
        imageStarView.leadingAnchor.constraint(equalTo: ratingView.leadingAnchor, constant: 30).isActive = true
        //configuration number stars rating
        let starRatingLabel = UILabel()
        starRatingLabel.text = coffee?.ratings ?? "5"
        starRatingLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        starRatingLabel.textColor = .black
        starRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingView.addSubview(starRatingLabel)
        starRatingLabel.leadingAnchor.constraint(equalTo: imageStarView.trailingAnchor,constant: 5).isActive = true
        starRatingLabel.centerYAnchor.constraint(equalTo: imageStarView.centerYAnchor).isActive = true
        //configure number ratings
        let ratingLabel = UILabel()
        ratingLabel.text = "(\(coffee?.numberRatings ?? "0"))"
        ratingLabel.font = UIFont.systemFont(ofSize: 12)
        ratingLabel.textColor = UIColor(named: "title_location")
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingView.addSubview(ratingLabel)
        ratingLabel.leadingAnchor.constraint(equalTo: starRatingLabel.trailingAnchor, constant: 2).isActive = true
        ratingLabel.lastBaselineAnchor.constraint(equalTo: starRatingLabel.lastBaselineAnchor).isActive = true
        
        //milk button
        let milkButton = buttonCoffeeRating(imageUrl: "milk")
        ratingView.addSubview(milkButton)
        milkButton.trailingAnchor.constraint(equalTo: ratingView.trailingAnchor, constant: -30).isActive = true
        milkButton.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor).isActive = true
        milkButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        milkButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        //coffee button
        let coffeeButton = buttonCoffeeRating(imageUrl: "bean")
        ratingView.addSubview(coffeeButton)
        coffeeButton.trailingAnchor.constraint(equalTo: milkButton.leadingAnchor, constant: -10).isActive = true
        coffeeButton.bottomAnchor.constraint(equalTo: ratingView.bottomAnchor).isActive = true
        coffeeButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        coffeeButton.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        detailStackView.addArrangedSubview(ratingView)
    }
    
    func buttonCoffeeRating(imageUrl: String) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(named: imageUrl), for: .normal)
        button.backgroundColor = UIColor(named: "button_color_2")
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
