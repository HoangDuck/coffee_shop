//
//  HomeViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        let tab1 = MenuTabViewController()
        
        let tab2 = UIViewController()
        tab2.view.backgroundColor = .red
        
        let tab3 = UIViewController()
        tab3.view.backgroundColor = .blue
        
        let tab4 = UIViewController()
        tab4.view.backgroundColor = .brown
        
        tab1.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Home"), tag: 0)
        tab2.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Heart"), tag: 1)
        tab3.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Bag 3"), tag: 2)
        tab4.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "Notification"), tag: 3)
        
        viewControllers = [
            tab1,
            tab2,
            tab3,
            tab4,
         ]
        
        selectedIndex = 0
        
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(named: "button_color")        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("view will layout subviews")
        
        if #available(iOS 13, *) {
            self.tabBar.standardAppearance.backgroundColor = .red
        } else {
            self.tabBar.barTintColor = .red
        }
    }
}
