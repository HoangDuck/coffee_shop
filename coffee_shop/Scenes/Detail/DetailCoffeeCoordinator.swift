//
//  DetailCoffeeCoordinator.swift
//  coffee_shop
//
//  Created by TE-Member on 26/03/2024.
//

import Foundation
import UIKit

class DetailCoffeeCoordinator: NSObject,DetailViewControllerDelegate {
    
    private var navigationController: UINavigationController?
    private var coffeeData: CoffeeMenu
    weak var delegate: DetailCoffeeCoordinatorDelegate?
    private var coordinators: [NSObject] = []
    
    init(_ navigationController: UINavigationController?, coffee: CoffeeMenu) {
        self.navigationController = navigationController
        self.coffeeData = coffee
        super.init()
    }
    
    func didBuyNowCoffee() {
        let vc = OrderViewController(coffee: coffeeData)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didPopDetailView() {
        navigationController?.popViewController(animated: true)
        self.coordinators.removeAll()
        self.delegate?.didPopDetailCoffeeView(self)
    }
    
    func start(){
        let viewController = DetailViewController(coffee: self.coffeeData)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}
