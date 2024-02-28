//
//  MenuTabViewController+Location+Avatar.swift
//  coffee_shop
//
//  Created by TE-Member on 20/02/2024.
//

import UIKit

extension MenuTabViewController {
    
    func addLocationAvatar() {
        addTitleLocation()
        addAvatar()
    }
    
    func addTitleLocation() {
        //title location
        locationTitle.text = "Location"
        locationTitle.font = UIFont.preferredFont(forTextStyle: .body)
        locationTitle.textColor = UIColor(named: "title_location")
        scrollView.addSubview(locationTitle)
        locationTitle.translatesAutoresizingMaskIntoConstraints = false
        locationTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        locationTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        
        //location
        location.text = "Bilzen, Tanjungbalai"
        location.font = UIFont.preferredFont(forTextStyle: .title3)
        location.textColor = .white
        scrollView.addSubview(location)
        location.translatesAutoresizingMaskIntoConstraints = false
        location.topAnchor.constraint(equalTo: locationTitle.bottomAnchor, constant: 5).isActive = true
        location.leadingAnchor.constraint(equalTo: locationTitle.leadingAnchor).isActive = true
        
        //icon location
        let imageIcon = UIImage(systemName: "chevron.down")
        let image = UIImageView()
        image.image = imageIcon
        image.tintColor = .white
        scrollView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: location.trailingAnchor, constant: 5).isActive = true
        image.topAnchor.constraint(equalTo: location.topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: location.bottomAnchor).isActive = true
    }
    
    func addAvatar(){
        //avatar
        let avatarView = UIImageView(image: avatar)
        avatarView.frame = CGRect(x: scrollView.frame.width - 60, y: 25, width: 40, height: 40)
        scrollView.addSubview(avatarView)
    }
}

