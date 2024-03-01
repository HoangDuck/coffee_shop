//
//  DeliveryViewController.swift
//  coffee_shop
//
//  Created by Hoang Duc on 16/02/2024.
//

import UIKit

class DeliveryViewController: UIViewController {
    let stackView: UIStackView = UIStackView()
    
    var titleLabel: UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UIStackView inside UIScrollView."
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = UIStackView.Distribution.fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.backgroundColor = .red
        
        for _ in 0...20 {
            stackView.addArrangedSubview(titleLabel)
        }
    }
}
