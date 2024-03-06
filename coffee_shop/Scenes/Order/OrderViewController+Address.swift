//
//  OrderViewController+Address.swift
//  coffee_shop
//
//  Created by TE-Member on 06/03/2024.
//

import UIKit

extension OrderViewController {
    func addAddressBar() {
        let addressView = UIView()
        addressView.backgroundColor = .clear
        addressView.translatesAutoresizingMaskIntoConstraints = false
        addressView.widthAnchor.constraint(equalToConstant: scrollView.frame.width-60).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 77).isActive = true
        //title
        let titleAddress = UILabel()
        titleAddress.text = "Delivery Address"
        titleAddress.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleAddress.textColor = .black
        titleAddress.translatesAutoresizingMaskIntoConstraints = false
        addressView.addSubview(titleAddress)
        titleAddress.leadingAnchor.constraint(equalTo: addressView.leadingAnchor).isActive = true
        titleAddress.topAnchor.constraint(equalTo: addressView.topAnchor).isActive = true
        //address customer
        let streetName = UILabel()
        streetName.text = "Jl. Kpg Sutoyo"
        streetName.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        streetName.textColor = .black
        streetName.translatesAutoresizingMaskIntoConstraints = false
        addressView.addSubview(streetName)
        streetName.centerYAnchor.constraint(equalTo: addressView.centerYAnchor,constant: 10).isActive = true
        streetName.leadingAnchor.constraint(equalTo: addressView.leadingAnchor).isActive = true

        //Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.
        let fullAddress = UILabel()
        fullAddress.text = "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai."
        fullAddress.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        fullAddress.textColor = UIColor(named: "options")
        fullAddress.translatesAutoresizingMaskIntoConstraints = false
        addressView.addSubview(fullAddress)
        fullAddress.leadingAnchor.constraint(equalTo: addressView.leadingAnchor).isActive = true
        fullAddress.bottomAnchor.constraint(equalTo: addressView.bottomAnchor).isActive = true
        orderStackView.addArrangedSubview(addressView)
    }
    
    func addEditAddress(){
        let listButtonView = UIView()
        listButtonView.translatesAutoresizingMaskIntoConstraints = false
        listButtonView.widthAnchor.constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        listButtonView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let buttonEditAddress = buttonWithIcons(text: "Edit Address",image: UIImage(named: "edit")!)
        buttonEditAddress.translatesAutoresizingMaskIntoConstraints = false
        listButtonView.addSubview(buttonEditAddress)
        buttonEditAddress.leadingAnchor.constraint(equalTo: listButtonView.leadingAnchor).isActive = true
        buttonEditAddress.topAnchor.constraint(equalTo: listButtonView.topAnchor).isActive = true
        buttonEditAddress.bottomAnchor.constraint(equalTo: listButtonView.bottomAnchor).isActive = true
        let buttonNote = buttonWithIcons(text: "Add Note", image: UIImage(named: "note")!)
        buttonNote.translatesAutoresizingMaskIntoConstraints = false
        listButtonView.addSubview(buttonNote)
        buttonNote.leadingAnchor.constraint(equalTo: buttonEditAddress.trailingAnchor,constant: 20).isActive = true
        buttonNote.topAnchor.constraint(equalTo: listButtonView.topAnchor).isActive = true
        buttonNote.bottomAnchor.constraint(equalTo: listButtonView.bottomAnchor).isActive = true
        
        orderStackView.addArrangedSubview(listButtonView)
        
    }
    
    func buttonWithIcons(text: String, image: UIImage) -> UIView {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor(named: "border_button")?.cgColor
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.layer.borderWidth = 1
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.titlePadding = CGFloat(10.0)
        buttonConfiguration.imagePadding = CGFloat(10.0)
        button.configuration = buttonConfiguration
        return button
    }
    
}
