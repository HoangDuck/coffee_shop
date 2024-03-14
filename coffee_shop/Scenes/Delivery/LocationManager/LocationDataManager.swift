//
//  LocationDataManager.swift
//  coffee_shop
//
//  Created by TE-Member on 13/03/2024.
//

import Foundation
import CoreLocation

class LocationDataManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationDataManager()
    
    // Create a location manager.
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        // Configure the location manager.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        requestPermission()
    }
    
    func requestPermission() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse,.authorizedAlways:
            print("authorized")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            locationManager.requestLocation()
        case .denied:
            print("denied")
        @unknown default:
            fatalError("Invalid permission")
        }
    }
}
