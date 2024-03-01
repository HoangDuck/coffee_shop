//
//  DetailViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class DetailViewController: UIViewController {
    let coffee: CoffeeMenu?
    
    init(coffee: CoffeeMenu?) {
        self.coffee = coffee
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("This method has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
    }
}
