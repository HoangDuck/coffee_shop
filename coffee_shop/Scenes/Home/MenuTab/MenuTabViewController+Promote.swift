//
//  MenuTabViewController+Promote.swift
//  coffee_shop
//
//  Created by TE-Member on 20/02/2024.
//

import UIKit

extension MenuTabViewController {
    func addPromotionView(){
        let image = UIImage(named: "promote_ex")
        let imageView = UIImageView(image: image)
        
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        imageView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 30).isActive = true
        imageView.sizeToFit()
    }
}

