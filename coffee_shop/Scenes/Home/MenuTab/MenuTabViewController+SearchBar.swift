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
                
        //left layout
        let iconSearch = UIImage(named: "search")
        let iconView  = UIImageView()
        iconView.image = iconSearch
        iconView.tintColor = .white
        searchBar.leftView = iconView
        searchBar.leftViewMode = .always
        
        //right layout
        let filterButtonView = UIButton(type: .custom)
        let iconFilter = UIImage(named: "filter_search")
        filterButtonView.setImage(iconFilter, for: .normal)
        filterButtonView.backgroundColor = UIColor(named: "button_color")
        filterButtonView.layer.cornerRadius = 15
        filterButtonView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        filterButtonView.widthAnchor.constraint(equalToConstant: 40)
            .isActive = true
        searchBar.rightView = filterButtonView
        searchBar.rightViewMode = .always
        
        //invisible show clear button
        searchBar.clearButtonMode = .never
        searchBar.frame = CGRect(x: 20, y: 105, width: scrollView.frame.width - 40, height: 52)
        scrollView.addSubview(searchBar)
    }
}
