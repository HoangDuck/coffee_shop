//
//  OrderViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class OrderViewController: UIViewController {
    let coffee: CoffeeMenu?
    let scrollView: UIScrollView = UIScrollView()
    let orderStackView: UIStackView = UIStackView()
    let shipFeeCut: Double = 1.0
    let shipFee: Double = 2.0
    let segmentControl: UISegmentedControl = UISegmentedControl()
    
    weak var delegate: OrderViewControllerDelegate?
    
    init(coffee: CoffeeMenu?) {
        self.coffee = coffee
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("This method has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        scrollView.bounds = view.bounds
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height*2)
        setupOrderStackView()
        addOrderBottomBar()
    }
    
    private func setupOrderStackView() {
        let contentView = UIView()
        orderStackView.axis = .vertical
        orderStackView.backgroundColor = .white
        orderStackView.distribution = .equalSpacing
        orderStackView.alignment = .center
        orderStackView.spacing = 20
        scrollView.addSubview(contentView)
        contentView.addSubview(orderStackView)
        orderStackView.addArrangedSubview(addBarDetail())
        addSegmentControlOrder()
        addAddressBar()
        addEditAddress()
        divider()
        addCoffeeNumber()
        boldDivider()
        addDiscountApplied()
        addTotalPayment()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        orderStackView.translatesAutoresizingMaskIntoConstraints = false
        orderStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        orderStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        orderStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        orderStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    private func addSegmentControlOrder() {
        segmentControl.insertSegment(withTitle: "Deliver", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "Pickup", at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = UIColor(named: "button_color")
        segmentControl.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        segmentControl.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16, weight: .semibold)], for: .selected)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.widthAnchor.constraint(equalToConstant: scrollView.frame.width-60).isActive = true
        segmentControl.heightAnchor.constraint(equalToConstant: 48).isActive = true
        orderStackView.addArrangedSubview(segmentControl)
    }
    
    private func addBarDetail() -> UIView {
        //configure bar view
        let barDetail = UIView()
        barDetail.translatesAutoresizingMaskIntoConstraints = false
        barDetail.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
        barDetail.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //configure back button
        let buttonBack = UIButton()
        buttonBack.backgroundColor = .clear
        buttonBack.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        buttonBack.imageView?.tintColor = .black
        buttonBack.addTarget(self, action: #selector(didPressBackButton(_:)), for: .touchUpInside)
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        barDetail.addSubview(buttonBack)
        buttonBack.centerYAnchor.constraint(equalTo: barDetail.centerYAnchor).isActive = true
        buttonBack.leadingAnchor.constraint(equalTo: barDetail.leadingAnchor, constant: 30).isActive = true
        //configure title bar
        let titleBar = UILabel()
        titleBar.text = "Order"
        titleBar.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleBar.textColor = .black
        titleBar.translatesAutoresizingMaskIntoConstraints = false
        barDetail.addSubview(titleBar)
        titleBar.centerYAnchor.constraint(equalTo: barDetail.centerYAnchor).isActive = true
        titleBar.centerXAnchor.constraint(equalTo: barDetail.centerXAnchor).isActive = true
        return barDetail
    }
    
    @objc private func didPressBackButton(_ sender: UIButton) {
        self.delegate?.didPopOrderViewCoffee()
    }
    
    func calculatePriceTotal() -> Double {
        var totalCost = 0.0
        let coffeePrice = coffee?.priceValue ?? 0.0
        totalCost = coffeePrice + shipFeeCut
        return totalCost
    }
    
    func divider() {
        let divider = UIView()
        divider.backgroundColor = UIColor(named: "title_location")
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.widthAnchor.constraint(equalToConstant: scrollView.frame.width-60).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        orderStackView.addArrangedSubview(divider)
    }
    
    func boldDivider() {
        let divider = UIView()
        divider.backgroundColor = UIColor(named: "title_location")
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.widthAnchor.constraint(equalToConstant: scrollView.frame.width).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 4).isActive = true
        orderStackView.addArrangedSubview(divider)
    }
}
