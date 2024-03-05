//
//  DetailViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class DetailViewController: UIViewController {
    let coffee: CoffeeMenu?
    let scrollView: UIScrollView = UIScrollView()
    //stack view
    let detailStackView: UIStackView = UIStackView()
    
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
        scrollView.bounds = view.bounds
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        setupDetailStackView()
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: detailStackView.frame.height)
        addPriceBottom()
    }
    
    private func setupDetailStackView() {
        let contentView = UIView()
        detailStackView.axis = .vertical
        detailStackView.backgroundColor = .white
        detailStackView.distribution = .equalSpacing
        detailStackView.alignment = .center
        detailStackView.spacing = 15
        scrollView.addSubview(contentView)
        contentView.addSubview(detailStackView)
        detailStackView.addArrangedSubview(addBarDetail())
        addCoffeeTitle()
        addRatingCoffee()
        divider()
        addDescriptionCoffee()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        detailStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        detailStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        detailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    private func addBarDetail() -> UIStackView {
        //configure stack view
        let barStackView = UIStackView()
        barStackView.axis = .horizontal
        barStackView.backgroundColor = .clear
        barStackView.alignment = .fill
        barStackView.distribution = .fillEqually
        barStackView.spacing = 110
        //configure back button
        let buttonBack = UIButton()
        buttonBack.backgroundColor = .clear
        buttonBack.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        buttonBack.imageView?.tintColor = .black
        buttonBack.addTarget(self, action: #selector(didPressBackButton(_:)), for: .touchUpInside)
        barStackView.addArrangedSubview(buttonBack)
        //configure title bar
        let titleBar = UILabel()
        titleBar.text = "Detail"
        titleBar.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleBar.textColor = .black
        barStackView.addArrangedSubview(titleBar)
        //configure favorite button
        let buttonFavorite = UIButton()
        buttonFavorite.backgroundColor = .clear
        buttonFavorite.setImage(UIImage(named: "Heart_2"), for: .normal)
        buttonFavorite.imageView?.tintColor = .black
        barStackView.addArrangedSubview(buttonFavorite)
        return barStackView
    }
    
    @objc private func didPressBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
