//
//  UserLocationAnnotation.swift
//  coffee_shop
//
//  Created by TE-Member on 13/03/2024.
//

import UIKit
import MapKit

class UserLocationAnnotation: NSObject, MKAnnotation {
    @objc dynamic var coordinate: CLLocationCoordinate2D
    
    let imageName: UIImage = UIImage(named: "pin")!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}
