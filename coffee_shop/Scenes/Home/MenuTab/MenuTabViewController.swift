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
    //var coffeeOptionView: UICollectionView!
    var coffees: [CoffeeMenu] = []
    var coffeeOptionView: UICollectionView = UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewFlowLayout())
    
    weak var delegate: MenuTabControllerDelegate?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.delegate?.didAppearTabOne(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func reloadDataCoffees(drinks: ListDrinks) {
        coffees = drinks.drinks?.map {
            drink in
            return CoffeeMenu( ratings: "4.7", title: drink.strDrink ?? "", notes: "With chocolate", price: "$ 4.5", priceValue: 4.5, description: "This is \(drink.strDrink ?? "")", numberRatings: "200",imageUrl: drink.strDrinkThumb ?? "")
        } ?? []
        DispatchQueue.main.async {
            self.coffeeOptionView.reloadData()
        }
    }
    
    private func setUpUI(){
        scrollView.bounds = view.bounds
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        view.backgroundColor = UIColor(named: "background_menu")
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height*1.15)
        setUpScrollUI()
    }
    
    private func setUpScrollUI(){
        addPadSearch()
        addLocationAvatar()
        addSearchBar()
        addPromotionView()
        addMenuCoffee()
    }
    
    private func addPadSearch() {
        viewPad.backgroundColor = UIColor(named: "pad_search")
        viewPad.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 280)
        scrollView.addSubview(viewPad)
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
