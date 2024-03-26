//
//  HomeViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate,MenuTabControllerDelegate {
    
    weak var homeDelegate: HomeViewControllerDelegate?
    
    init(){
        super.init(nibName: nil, bundle: nil)
        object_setClass(self.tabBar, CustomTabBar.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpTabBar()
        setUpUI()
    }
    
    private func setUpTabBar() {
        let tab1 = MenuTabViewController()
        tab1.delegate = self
        let tab2 = MenuTabViewController()
        let tab3 = MenuTabViewController()
        let tab4 = MenuTabViewController()
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
    }
    
    private func setUpUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 30
        
        tabBar.tintColor = UIColor(named: "button_color")
        
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance;
            tabBar.scrollEdgeAppearance = appearance
        } else {
            self.tabBar.barTintColor = .white
        }
    }
    
    func didSelectCoffee(coffee: CoffeeMenu) {
        self.homeDelegate?.didSelectCoffee(coffee: coffee)
    }
    
    class CustomTabBar: UITabBar {
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var sizeThatFits = super.sizeThatFits(size)
            sizeThatFits.height = 120
            return sizeThatFits
        }
    }
}
