//
//  OrderViewController+OrderDelivery.swift
//  coffee_shop
//
//  Created by TE-Member on 06/03/2024.
//

import UIKit

extension OrderViewController {
    func addOrderBottomBar() {
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
        view.heightAnchor.constraint(equalToConstant: 161).isActive = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //button buy now
        let buttonBuyNow = UIButton()
        buttonBuyNow.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        buttonBuyNow.setTitle("Order", for: .normal)
        buttonBuyNow.setTitleColor(.white, for: .normal)
        buttonBuyNow.backgroundColor = UIColor(named: "button_color")
        buttonBuyNow.layer.cornerRadius = 20
        view.addSubview(buttonBuyNow)
        buttonBuyNow.translatesAutoresizingMaskIntoConstraints = false
        buttonBuyNow.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        buttonBuyNow.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        buttonBuyNow.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        buttonBuyNow.heightAnchor.constraint(equalToConstant: 62).isActive = true
        buttonBuyNow.addTarget(self, action: #selector(orderNowTap(_ :)), for: .touchUpInside)
        //icon cash
        let imageView = UIImageView(image: UIImage(named: "moneys"))
        imageView.tintColor = UIColor(named: "button_color")
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        //icon options
        let imageOptionView = UIImageView(image: UIImage(systemName: "ellipsis.circle.fill"))
        imageOptionView.tintColor = UIColor(named: "options")
        imageOptionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageOptionView)
        imageOptionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        imageOptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        imageOptionView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageOptionView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        //cash item
        let cashItemCard = UIView()
        cashItemCard.backgroundColor = UIColor(named: "cash_background")
        cashItemCard.layer.cornerRadius = 12
        cashItemCard.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cashItemCard)
        cashItemCard.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        cashItemCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65).isActive = true
        cashItemCard.heightAnchor.constraint(equalToConstant: 24).isActive = true
        cashItemCard.widthAnchor.constraint(equalToConstant: 121).isActive = true
        let cashTitle = UILabel()
        cashTitle.text = "Cash"
        cashTitle.textAlignment = .center
        cashTitle.textColor = .white
        cashTitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        cashTitle.backgroundColor = UIColor(named: "button_color")
        cashTitle.layer.masksToBounds = true
        cashTitle.layer.cornerRadius = 12
        cashTitle.translatesAutoresizingMaskIntoConstraints = false
        cashItemCard.addSubview(cashTitle)
        cashTitle.topAnchor.constraint(equalTo: cashItemCard.topAnchor).isActive = true
        cashTitle.leadingAnchor.constraint(equalTo: cashItemCard.leadingAnchor).isActive = true
        cashTitle.bottomAnchor.constraint(equalTo: cashItemCard.bottomAnchor).isActive = true
        cashTitle.widthAnchor.constraint(equalToConstant: 51).isActive = true
        //price title
        let priceTitle = UILabel()
        priceTitle.text = "$ \(calculatePriceTotal())"
        priceTitle.textAlignment = .center
        priceTitle.textColor = .black
        priceTitle.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        priceTitle.translatesAutoresizingMaskIntoConstraints = false
        cashItemCard.addSubview(priceTitle)
        priceTitle.topAnchor.constraint(equalTo: cashItemCard.topAnchor, constant: 5).isActive = true
        priceTitle.bottomAnchor.constraint(equalTo: cashItemCard.bottomAnchor, constant: -5).isActive = true
        priceTitle.trailingAnchor.constraint(equalTo: cashItemCard.trailingAnchor, constant: -25).isActive = true
    }
    
    @objc func orderNowTap(_ sender: UIButton) {
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
