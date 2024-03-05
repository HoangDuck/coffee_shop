//
//  DetailViewController+DescriptionCoffee.swift
//  coffee_shop
//
//  Created by TE-Member on 05/03/2024.
//

import UIKit

extension DetailViewController {
    func addDescriptionCoffee() {
        let descriptionCoffee = UIView()
        descriptionCoffee.translatesAutoresizingMaskIntoConstraints = false
        let widthDescriptionCoffee = scrollView.frame.width
        descriptionCoffee.widthAnchor.constraint(equalToConstant: widthDescriptionCoffee).isActive = true
        //title description
        let title = UILabel()
        title.text = "Description"
        title.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        descriptionCoffee.addSubview(title)
        title.topAnchor.constraint(equalTo: descriptionCoffee.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: descriptionCoffee.leadingAnchor, constant: 30).isActive = true
        //description detail coffee
        let descriptionDetail = UILabel()
        descriptionDetail.numberOfLines = 3
        descriptionDetail.text = coffee?.description
        descriptionDetail.font = UIFont.systemFont(ofSize: 14)
        descriptionDetail.textColor = UIColor(named: "description_coffee")
        descriptionDetail.translatesAutoresizingMaskIntoConstraints = false
        descriptionCoffee.addSubview(descriptionDetail)
        descriptionDetail.leadingAnchor.constraint(equalTo: descriptionCoffee.leadingAnchor, constant: 30).isActive = true
        descriptionDetail.trailingAnchor.constraint(equalTo: descriptionCoffee.trailingAnchor, constant: -30).isActive = true
        descriptionDetail.topAnchor.constraint(equalTo: descriptionCoffee.bottomAnchor, constant: 10).isActive = true
        let height = title.frame.height + descriptionDetail.frame.height + CGFloat(20.0)
        descriptionCoffee.heightAnchor.constraint(equalToConstant: height).isActive = true
        detailStackView.addArrangedSubview(descriptionCoffee)
        
    }
}
