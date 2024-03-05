//
//  DetailViewController+Price.swift
//  coffee_shop
//
//  Created by TE-Member on 04/03/2024.
//

import UIKit

extension DetailViewController {
    func addPriceBottom() {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        self.view.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: 121).isActive = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //title price
        let titlePrice = UILabel()
        titlePrice.text = "Price"
        titlePrice.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        titlePrice.textColor = UIColor(named: "description_coffee")
        view.addSubview(titlePrice)
        titlePrice.translatesAutoresizingMaskIntoConstraints = false
        titlePrice.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        titlePrice.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        //price value
        let priceValue = UILabel()
        priceValue.text = coffee?.price ?? "$ 0"
        priceValue.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        priceValue.textColor = UIColor(named: "button_color")
        view.addSubview(priceValue)
        priceValue.translatesAutoresizingMaskIntoConstraints = false
        priceValue.topAnchor.constraint(equalTo: titlePrice.bottomAnchor, constant: 10).isActive = true
        priceValue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        //button buy now
        let buttonBuyNow = UIButton()
        buttonBuyNow.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        buttonBuyNow.setTitle("Buy now", for: .normal)
        buttonBuyNow.setTitleColor(.white, for: .normal)
        buttonBuyNow.backgroundColor = UIColor(named: "button_color")
        buttonBuyNow.layer.cornerRadius = 20
        view.addSubview(buttonBuyNow)
        buttonBuyNow.translatesAutoresizingMaskIntoConstraints = false
        buttonBuyNow.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        buttonBuyNow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        buttonBuyNow.heightAnchor.constraint(equalToConstant: 62).isActive = true
        buttonBuyNow.widthAnchor.constraint(equalToConstant: 217).isActive = true
        buttonBuyNow.addTarget(self, action: #selector(buyNowTap(_ :)), for: .touchUpInside)
    }
    
    @objc func buyNowTap(_ sender: UIButton) {
        let vc = OrderViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
