//
//  AnnotationShipperView.swift
//  coffee_shop
//
//  Created by TE-Member on 12/03/2024.
//

import UIKit
import MapKit

class AnnotationShipperView: MKAnnotationView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: nil)
        return imageView
    }()
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI(){
        print("Set up view annotations Shipper View")
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 30
        if let icon = annotation as? ShipperAnnotation  {
            print("ADd Set up view annotations Shipper View")
            imageView.image = icon.imageName
            addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This method has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("Set up view annotations prepareForReuse")
        imageView.image = nil
    }
    
    override func prepareForDisplay() {
        super.prepareForDisplay()
        if let annotation = annotation as? ShipperAnnotation {
            imageView.image = annotation.imageName
        }
        
        // Since the image and text sizes may have changed, require the system do a layout pass to update the size of the subviews.
        setNeedsLayout()
    }
}
