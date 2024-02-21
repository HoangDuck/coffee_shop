//
//  MenuTabViewController+SearchBar.swift
//  coffee_shop
//
//  Created by TE-Member on 20/02/2024.
//

import UIKit

extension MenuTabViewController {
    func addSearchBar() {
        //search bar style's configuration
        searchBar.backgroundColor = UIColor(named: "search_bar")
        searchBar.attributedPlaceholder =  NSAttributedString(
            string: "Search coffee",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        searchBar.textColor = .white
        searchBar.layer.cornerRadius = 15
        
        let padding = 8
        let size = 20
        
        //left layout
        let iconSearch = UIImage(named: "search")
        let outerLeftView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
        let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
        iconView.image = iconSearch
        iconView.tintColor = .white
        outerLeftView.addSubview(iconView)
        searchBar.leftView = outerLeftView
        searchBar.leftViewMode = .always
        
        //right layout
        let filterButtonView = UIButton(type: .custom)
        let iconFilter = UIImage(named: "filter_search")
        filterButtonView.setImage(iconFilter, for: .normal)
        
        filterButtonView.backgroundColor = UIColor(named: "button_color")
        filterButtonView.layer.cornerRadius = 15
        filterButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        filterButtonView.widthAnchor.constraint(equalToConstant: 45)
            .isActive = true
        
        searchBar.rightView = filterButtonView
        searchBar.rightViewMode = .always
        
        searchBar.clearButtonMode = .never
        
        scrollView.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: 20).isActive = true
        searchBar.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 40).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
}
