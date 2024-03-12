//
//  ShipperAnnotation.swift
//  coffee_shop
//
//  Created by TE-Member on 12/03/2024.
//

import UIKit
import MapKit

class ShipperAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    let imageName: UIImage = UIImage(named: "bike_2")!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
