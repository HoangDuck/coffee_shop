//
//  DeliveryViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit
import MapKit

class DeliveryViewController: UIViewController {
    let mapView: MKMapView = MKMapView()
    
    private var allAnnotations: [MKAnnotation] = []
    
    private var displayedAnnotations: [MKAnnotation]? {
        willSet {
            if let currentAnnotations = displayedAnnotations {
                print("Remove annotations \(currentAnnotations)")
                mapView.removeAnnotations(currentAnnotations)
            }
        }
        didSet {
            if let newAnnotations = displayedAnnotations {
                print("Add annotations \(newAnnotations)")
                mapView.addAnnotations(newAnnotations)
            }
            setRegionUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        addButtonNavigator()
        showSheetBottom()
    }
    
    private func registerAnnotations(){
        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(MKUserLocation.self))
        mapView.register(MKAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(ShipperAnnotation.self))
    }
    
    private func setupMapView(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.backgroundColor = UIColor(named: "background_menu")
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.setUserTrackingMode(.follow, animated: true)
        self.view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        mapView.delegate = self
        registerAnnotations()
        addLocations()
    }
    
    private func setRegionUser(){
        guard let firstAnnotation = displayedAnnotations?.first else {
            fatalError("Can't determine location")
        }
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: firstAnnotation.coordinate.latitude, longitude: firstAnnotation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)), animated: true)
    }
    
    private func addLocations(){
        allAnnotations = [ShipperAnnotation(coordinate: CLLocationCoordinate2D(latitude: 10.801638955557912, longitude: 106.66260241728925)), mapView.userLocation]
        showLocations()
    }
    
    private func showLocations(){
        displayedAnnotations = allAnnotations
    }
    
    private func setupViewForUserLocationAnnotations(for annotation: MKUserLocation, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(MKUserLocation.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        return view
    }
    
    private func setupViewForShipperAnnotations(for annotation: ShipperAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(ShipperAnnotation.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        return view
    }
}

extension DeliveryViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationViews: MKAnnotationView?
        print("Set up view annotations")
        if let annotation = annotation as? MKUserLocation {
            annotationViews = setupViewForUserLocationAnnotations(for: annotation, on: mapView)
        } else if let annotation = annotation as? ShipperAnnotation {
            print("Set up view annotations shipper")
            annotationViews = setupViewForShipperAnnotations(for: annotation, on: mapView)
        }
        return annotationViews
    }
}
