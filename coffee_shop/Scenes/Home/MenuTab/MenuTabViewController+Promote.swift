//
//  MenuTabViewController+Promote.swift
//  coffee_shop
//
//  Created by TE-Member on 20/02/2024.
//

import UIKit

extension MenuTabViewController {
    func addPromotionView(){
        let image = UIImage(named: "promote_ex")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 20, y: 200, width: scrollView.frame.width - 40, height: 140)
        scrollView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
    }
}

