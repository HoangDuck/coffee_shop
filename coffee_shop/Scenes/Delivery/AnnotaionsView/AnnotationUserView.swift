//
//  AnnotationUserView.swift
//  coffee_shop
//
//  Created by TE-Member on 12/03/2024.
//

import UIKit
import MapKit

class AnnotationUserView: MKAnnotationView {
    
    private let imageViewLocation: UIImageView = {
        let imageView = UIImageView(image: nil)
        return imageView
    }()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        layer.masksToBounds = true
        layer.cornerRadius = 30
        imageViewLocation.image = UIImage(named: "pin")
        addSubview(imageViewLocation)
        imageViewLocation.translatesAutoresizingMaskIntoConstraints = false
        imageViewLocation.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageViewLocation.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This method has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewLocation.image = nil
    }
}
