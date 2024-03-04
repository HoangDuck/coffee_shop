//
//  DetailViewController+Divider.swift
//  coffee_shop
//
//  Created by TE-Member on 04/03/2024.
//

import UIKit

extension DetailViewController {
    func divider() {
        let divider = UIView()
        divider.backgroundColor = UIColor(named: "title_location")
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.widthAnchor.constraint(equalToConstant: 330).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        detailStackView.addArrangedSubview(divider)
    }
}
