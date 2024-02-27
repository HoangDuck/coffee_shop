//
//  MenuTabViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 19/02/2024.
//

import UIKit

class MenuTabViewController: UIViewController {
    //View scroll view
    let scrollView: UIScrollView = UIScrollView()
    let viewPad: UIView = UIView()
    let stackView: UIStackView = UIStackView()
    
    //Views location+avatar
    let locationTitle: UILabel = UILabel()
    let location: UILabel = UILabel()
    let avatar: UIImage = UIImage(named: "avatar")!
    
    //Views search bars
    let searchBar: TextFieldWithPadding = TextFieldWithPadding()
    
    //views horizontal list view
    let coffeeCategoryView: UIScrollView = UIScrollView()
    //views menu coffees
    var coffeeOptionView: UICollectionView!
    let coffees: [CoffeeMenu] = CoffeeMenu.mockMenu
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        view.addSubview(scrollView)
        view.backgroundColor = UIColor(named: "background_menu")
        setUpScrollUI()
    }
    
    private func setUpScrollUI(){
        scrollView.contentSize = CGSize(width: .zero, height: view.frame.height*2)
        addPadSearch()
        addLocationAvatar()
        addSearchBar()
        addPromotionView()
        addMenuCoffee()
    }
    
    private func addPadSearch() {
        viewPad.backgroundColor = UIColor(named: "pad_search")
        scrollView.showsVerticalScrollIndicator = true
        scrollView.addSubview(viewPad)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        configurationConstraint()
    }
    
    private func configurationConstraint() {
        viewPad.translatesAutoresizingMaskIntoConstraints = false
        viewPad.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        viewPad.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        viewPad.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        viewPad.heightAnchor.constraint(equalToConstant: 280).isActive = true
        viewPad.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 10,
        bottom: 0,
        right: 10
    )
    
    var leftViewPadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)
    
    var rightViewPadding = UIEdgeInsets(
        top: 0, left: -5, bottom: 0, right: 5
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.leftViewRect(forBounds: bounds)
        return rect.inset(by: leftViewPadding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.inset(by: rightViewPadding)
    }
}
