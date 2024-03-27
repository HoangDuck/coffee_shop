//
//  DeliveryCoffeeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 27/03/2024.
//

import Foundation
import UIKit

class DeliveryCoffeeCoordinator: NSObject, DeliveryViewControllerDelegate {
    
    private var navigationController: UINavigationController?
    weak var delegate: DeliveryCoffeeCoordinatorDelegate?
    
    init(_ navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init()
    }
    
    func start() {
        let viewController = DeliveryViewController()
        viewController.delegate = self
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func didPopDeliveryView() {
        navigationController?.popViewController(animated: true)
        self.delegate?.didPopDeliveryView(self)
    }
}
