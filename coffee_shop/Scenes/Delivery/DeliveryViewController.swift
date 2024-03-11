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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        addButtonNavigator()
        showSheetBottom()
    }
    
    private func setupMapView(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.backgroundColor = UIColor(named: "background_menu")
        mapView.showsUserLocation = true
        mapView.isRotateEnabled = false
        mapView.showsUserTrackingButton = true
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10.80301730658949, longitude: 106.62934146213482), span: MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)), animated: true)
        self.view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
    
    func showSheetBottom(){
        let heightSheet = self.view.frame.height / 3
        let vc = DeliveryTrackingViewController()
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.custom {
                context in
                CGFloat(heightSheet)
            },.large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(vc, animated: false,completion: nil)
    }
    
    func addButtonNavigator(){
        //navigator back button
        let backButton = UIButton()
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.imageView?.tintColor = .black
        backButton.backgroundColor = .white
        backButton.layer.masksToBounds = true
        backButton.layer.cornerRadius = 18
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(navigatorBack(_ :)), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 60).isActive = true
        
        //gps button
        let gpsButton = UIButton()
        gpsButton.setImage(UIImage(named: "gps"), for: .normal)
        gpsButton.imageView?.tintColor = .black
        gpsButton.backgroundColor = .white
        gpsButton.layer.masksToBounds = true
        gpsButton.layer.cornerRadius = 18
        gpsButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gpsButton)
        gpsButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        gpsButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        gpsButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        gpsButton.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 60).isActive = true
    }
    
    @objc private func navigatorBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
