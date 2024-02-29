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
    let columnView: UIStackView = UIStackView()
    
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
    
    func setupUI(){
        //set up ui scroll view
        scrollView.bounds = view.bounds
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        //set up ui column view
        columnView.backgroundColor = .red
        columnView.axis = .vertical
        columnView.alignment = .center
        columnView.spacing = 20
        columnView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 400)
        scrollView.addSubview(columnView)
        let imageView = UIImageView(image: UIImage(systemName: "circle"))
        columnView.addArrangedSubview(imageView)
        columnView.addArrangedSubview(imageView)
        columnView.addArrangedSubview(imageView)
        columnView.addArrangedSubview(imageView)
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height*2)

    }
}
