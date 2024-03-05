//
//  DetailViewController+Size.swift
//  coffee_shop
//
//  Created by TE-Member on 05/03/2024.
//

import UIKit

extension DetailViewController {
    func addSizeChoose(){
        let sizeChoosingView = UIView()
        sizeChoosingView.translatesAutoresizingMaskIntoConstraints = false
        let width = scrollView.frame.width
        sizeChoosingView.widthAnchor.constraint(equalToConstant: width).isActive = true
        //title
        let title = UILabel()
        title.text = "Size"
        title.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        sizeChoosingView.addSubview(title)
        title.topAnchor.constraint(equalTo: sizeChoosingView.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: sizeChoosingView.leadingAnchor, constant: 30).isActive = true
        sizeChoosingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //list buttons choose size
        let listButtonView = UIStackView()
        listButtonView.axis = .horizontal
        listButtonView.distribution = .fillEqually
        listButtonView.alignment = .center
        listButtonView.spacing = 15
        listButtonView.translatesAutoresizingMaskIntoConstraints = false
        sizeChoosingView.addSubview(listButtonView)
        listButtonView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
        listButtonView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        listButtonView.leadingAnchor.constraint(equalTo: sizeChoosingView.leadingAnchor,constant: 30).isActive = true
        listButtonView.trailingAnchor.constraint(equalTo: sizeChoosingView.trailingAnchor,constant: -30).isActive = true
        listButtonView.addArrangedSubview(buttonSize(text: "S", isSelected: false))
        listButtonView.addArrangedSubview(buttonSize(text: "M", isSelected: true))
        listButtonView.addArrangedSubview(buttonSize(text: "L", isSelected: false))
        detailStackView.addArrangedSubview(sizeChoosingView)
    }
    
    func buttonSize(text: String,isSelected: Bool) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 96, height: 43))
        button.setTitle(text, for: .normal)
        button.setTitleColor(isSelected ? UIColor(named: "button_color") : .black, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = isSelected ? UIColor(named: "button_size") : .white
        button.layer.borderWidth = 1
        button.layer.borderColor = isSelected ? UIColor(named: "button_color")?.cgColor : UIColor(named: "title_location")?.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        button.widthAnchor.constraint(equalToConstant: 96).isActive = true
        
        return button
    }
    
}
