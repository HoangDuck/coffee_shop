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
    
    private var currentLocation: CLLocationCoordinate2D?
    
    private var allAnnotations: [MKAnnotation] = []
    
    private var locationManager: LocationDataManager?
    
    private var displayedAnnotations: [MKAnnotation]? {
        willSet {
            if let currentAnnotations = displayedAnnotations {
                mapView.removeAnnotations(currentAnnotations)
            }
        }
        didSet {
            if let newAnnotations = displayedAnnotations {
                mapView.addAnnotations(newAnnotations)
            }
            setRegionUser()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocationManager()
        setupMapView()
        addButtonNavigator()
        showSheetBottom()
    }
    
    private func setupLocationManager(){
        locationManager = LocationDataManager()
    }
    
    private func registerAnnotations(){
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(UserLocationAnnotation.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(ShipperAnnotation.self))
        mapView.register(MKMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(MKUserLocation.self))
    }
    
    private func setupMapView(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.backgroundColor = UIColor(named: "background_menu")
        mapView.isRotateEnabled = false
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
    
    func setRegionUser(){
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: mapView.userLocation.coordinate.latitude, longitude: mapView.userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)), animated: true)
    }
    
    private func drawPathOverlay(){
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: currentLocation ?? CLLocationCoordinate2D(latitude: 37.790846568432094, longitude: -122.42046253995784)))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: displayedAnnotations![0].coordinate))
        request.transportType = .any
        let serviceGetData = MKDirections(request: request)
        serviceGetData.calculate(completionHandler: {
            response, error in
            if error == nil {
                print("Add overlay")
                let overlayPathMap = response!.routes[0].polyline
                self.mapView.addOverlay(overlayPathMap ,level: .aboveRoads)
            } else {
                print("Error overlay \(String(describing: error))")
            }
        })
    }
    
    private func addLocations(){
        allAnnotations = [ShipperAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.78686137506034, longitude: -122.39838467635273))]
        showLocations()
    }
    
    private func showLocations(){
        displayedAnnotations = allAnnotations
    }
    
    private func setupViewForCurrentUserLocationAnnotations(for annotation: MKUserLocation, on mapView: MKMapView) -> MKAnnotationView {
        annotation.title = ""
        let identifier = NSStringFromClass(MKUserLocation.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        return view
    }
    
    private func setupViewForUserLocationAnnotations(for annotation: UserLocationAnnotation, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(UserLocationAnnotation.self)
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
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        currentLocation = userLocation.coordinate
        drawPathOverlay()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationViews: MKAnnotationView?
        print("Set up view annotations")
        if let annotation = annotation as? UserLocationAnnotation {
            print("Set up view annotations MKUserLocation")
            annotationViews = setupViewForUserLocationAnnotations(for: annotation, on: mapView)
        } else if let annotation = annotation as? ShipperAnnotation {
            print("Set up view annotations shipper")
            annotationViews = setupViewForShipperAnnotations(for: annotation, on: mapView)
        } else if let annotation = annotation as? MKUserLocation {
            print("Set up view annotations location")
            annotationViews = setupViewForCurrentUserLocationAnnotations(for: annotation, on: mapView)
        }
        return annotationViews
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let overlayLine = overlay as? MKPolyline {
            let overlayRender = MKPolylineRenderer(overlay: overlayLine)
            overlayRender.lineWidth = 4
            overlayRender.strokeColor = UIColor(named: "button_color")
            return overlayRender
        }
        return MKOverlayRenderer(overlay: overlay)
    }
}
