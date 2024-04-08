//
//  DetailViewController+Coffee.swift
//  coffee_shop
//
//  Created by TE-Member on 04/03/2024.
//

import UIKit
import Foundation

extension DetailViewController {
    func addCoffeeTitle() {
        //image coffee
        let imageView = UIImageView()
        imageView.load(url: URL(string: coffee?.imageUrl ?? "")!)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 330).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 226).isActive = true
        detailStackView.addArrangedSubview(imageView)
        //title
        let titleStackView = UIStackView()
        let title = UILabel()
        title.text = coffee?.title
        title.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        title.textColor = .black
        titleStackView.axis = .horizontal
        titleStackView.alignment = .leading
        titleStackView.distribution = .fill
        titleStackView.addArrangedSubview(title)
        titleStackView.setCustomSpacing(scrollView.frame.width-160, after: title)
        titleStackView.addArrangedSubview(UIView())
        detailStackView.addArrangedSubview(titleStackView)
        //description
        let descriptionStackView = UIStackView()
        let description = UILabel()
        description.text = coffee?.notes
        description.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        description.textColor = UIColor(named: "description_coffee")
        descriptionStackView.axis = .horizontal
        descriptionStackView.alignment = .leading
        descriptionStackView.distribution = .fill
        descriptionStackView.addArrangedSubview(description)
        descriptionStackView.setCustomSpacing(scrollView.frame.width-145, after: description)
        descriptionStackView.addArrangedSubview(UIView())
        detailStackView.addArrangedSubview(descriptionStackView)
    }
}
