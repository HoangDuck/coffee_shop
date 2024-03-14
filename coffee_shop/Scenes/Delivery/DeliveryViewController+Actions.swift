//
//  DeliveryViewController+Actions.swift
//  coffee_shop
//
//  Created by TE-Member on 13/03/2024.
//

import UIKit

extension DeliveryViewController {
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
        gpsButton.addTarget(self, action: #selector(navigateToUserLocation(_ :)), for: .touchUpInside)
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
    
    @objc private func navigateToUserLocation(_ sender: UIButton) {
        setRegionUser()
    }
}
