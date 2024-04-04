//
//  OnboardingCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 27/03/2024.
//

import Foundation
import UIKit

class OnboardingCoordinator: NSObject, OnboardViewControllerDelegate {
    
    private var navigationController: UINavigationController?
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init()
    }
    
    func navigateToHome() {
        let request = RequestGetListCoffee()
        let requestSend = SendableRequest<ListDrinks>(requestTemplate: request)
        requestSend.send(successCallback: {
            data in
            print(data ?? [])
        }) {
            error in
            print(error.localizedDescription)
        }
        let homeCoordinator = HomeCoordinator(navigationController)
        homeCoordinator.start()
    }
    
    func start(){
        let storyBoardOnboard = UIStoryboard(name: "OnboardViewController", bundle: nil)
        if let onboardViewController = storyBoardOnboard.instantiateViewController(identifier: "OnboardViewController") as? OnboardViewController {
            onboardViewController.delegate = self
            self.navigationController?.pushViewController(onboardViewController, animated: true)
        }
    }
}
