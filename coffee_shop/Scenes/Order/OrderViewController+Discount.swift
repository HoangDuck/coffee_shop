//
//  OrderViewController+Discount.swift
//  coffee_shop
//
//  Created by TE-Member on 07/03/2024.
//

import UIKit

extension OrderViewController {
    func addDiscountApplied(){
        let viewDiscount = UIView()
        viewDiscount.layer.cornerRadius = 10
        viewDiscount.layer.masksToBounds = true
        viewDiscount.layer.borderColor = UIColor(named: "border_button")?.cgColor
        viewDiscount.layer.borderWidth = 1
        viewDiscount.translatesAutoresizingMaskIntoConstraints = false
        viewDiscount.widthAnchor.constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        viewDiscount.heightAnchor.constraint(equalToConstant: 56).isActive = true
        //image icon discount
        let icon = UIImageView(image: UIImage(named: "discount"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        viewDiscount.addSubview(icon)
        icon.centerYAnchor.constraint(equalTo: viewDiscount.centerYAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: viewDiscount.leadingAnchor, constant: 16).isActive = true
        //icon discloure
        let iconRightClosure = UIImageView(image: UIImage(systemName: "chevron.right"))
        iconRightClosure.tintColor = .black
        iconRightClosure.translatesAutoresizingMaskIntoConstraints = false
        viewDiscount.addSubview(iconRightClosure)
        iconRightClosure.centerYAnchor.constraint(equalTo: viewDiscount.centerYAnchor).isActive = true
        iconRightClosure.trailingAnchor.constraint(equalTo: viewDiscount.trailingAnchor, constant: -16).isActive = true
        //title discount
        let titleDiscount = UILabel()
        titleDiscount.text = "1 Discount is applied"
        titleDiscount.textColor = .black
        titleDiscount.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleDiscount.translatesAutoresizingMaskIntoConstraints = false
        viewDiscount.addSubview(titleDiscount)
        titleDiscount.centerYAnchor.constraint(equalTo: viewDiscount.centerYAnchor).isActive = true
        titleDiscount.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10).isActive = true

        orderStackView.addArrangedSubview(viewDiscount)
    }
}
