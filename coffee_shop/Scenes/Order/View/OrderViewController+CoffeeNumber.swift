//
//  OrderViewController+CoffeeNumber.swift
//  coffee_shop
//
//  Created by TE-Member on 06/03/2024.
//

import UIKit

extension OrderViewController {
    func addCoffeeNumber(){
        let viewCoffeeNumber = UIView()
        viewCoffeeNumber.translatesAutoresizingMaskIntoConstraints = true
        viewCoffeeNumber.widthAnchor.constraint(equalToConstant: scrollView.frame.width-60).isActive = true
        viewCoffeeNumber.heightAnchor.constraint(equalToConstant: 55).isActive = true
        //let image
        let imageView = UIImageView()
        imageView.load(url: URL(string: coffee?.imageUrl ?? "")!)
        imageView.frame = CGRect(x: 0, y: 0, width: 55, height: 55)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.contentMode = .scaleAspectFill
        viewCoffeeNumber.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: viewCoffeeNumber.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        //let title coffee
        let titleCoffee = UILabel()
        titleCoffee.text = coffee?.title ?? ""
        titleCoffee.textColor = .black
        titleCoffee.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleCoffee.translatesAutoresizingMaskIntoConstraints = false
        viewCoffeeNumber.addSubview(titleCoffee)
        titleCoffee.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10)
            .isActive = true
        titleCoffee.topAnchor.constraint(equalTo: imageView.firstBaselineAnchor,constant: 5).isActive = true
        //let title note coffee
        let noteCoffee = UILabel()
        noteCoffee.text = coffee?.notes ?? ""
        noteCoffee.textColor = UIColor(named: "description_coffee")
        noteCoffee.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        noteCoffee.translatesAutoresizingMaskIntoConstraints = false
        viewCoffeeNumber.addSubview(noteCoffee)
        noteCoffee.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10).isActive = true
        noteCoffee.bottomAnchor.constraint(equalTo: imageView.lastBaselineAnchor, constant: -5).isActive = true
        //increase decrease number coffee
        
        let buttonPlus = UIButton()
        buttonPlus.setImage(UIImage(systemName: "plus"), for: .normal)
        buttonPlus.imageView?.tintColor = .black
        buttonPlus.layer.masksToBounds = true
        buttonPlus.layer.cornerRadius = 14
        buttonPlus.layer.borderWidth = 1
        buttonPlus.layer.borderColor = UIColor(named: "border_minus")?.cgColor
        buttonPlus.translatesAutoresizingMaskIntoConstraints = false
        viewCoffeeNumber.addSubview(buttonPlus)
        buttonPlus.trailingAnchor.constraint(equalTo: viewCoffeeNumber.trailingAnchor).isActive = true
        buttonPlus.centerYAnchor.constraint(equalTo: viewCoffeeNumber.centerYAnchor).isActive = true
        buttonPlus.widthAnchor.constraint(equalToConstant: 28).isActive = true
        buttonPlus.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        let numberTitle = UILabel()
        numberTitle.text = "1"
        numberTitle.textColor = .black
        numberTitle.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        numberTitle.translatesAutoresizingMaskIntoConstraints = false
        viewCoffeeNumber.addSubview(numberTitle)
        numberTitle.trailingAnchor.constraint(equalTo: buttonPlus.leadingAnchor, constant: -10).isActive = true
        numberTitle.centerYAnchor.constraint(equalTo: viewCoffeeNumber.centerYAnchor).isActive = true
        
        let buttonMinus = UIButton()
        buttonMinus.setImage(UIImage(systemName: "minus"), for: .normal)
        buttonMinus.imageView?.tintColor = UIColor(named: "border_minus")
        buttonMinus.layer.masksToBounds = true
        buttonMinus.layer.cornerRadius = 14
        buttonMinus.layer.borderWidth = 1
        buttonMinus.layer.borderColor = UIColor(named: "border_minus")?.cgColor
        buttonMinus.translatesAutoresizingMaskIntoConstraints = false
        viewCoffeeNumber.addSubview(buttonMinus)
        buttonMinus.trailingAnchor.constraint(equalTo: numberTitle.leadingAnchor,constant: -10).isActive = true
        buttonMinus.centerYAnchor.constraint(equalTo: viewCoffeeNumber.centerYAnchor).isActive = true
        buttonMinus.widthAnchor.constraint(equalToConstant: 28).isActive = true
        buttonMinus.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        orderStackView.addArrangedSubview(viewCoffeeNumber)
    }
}
