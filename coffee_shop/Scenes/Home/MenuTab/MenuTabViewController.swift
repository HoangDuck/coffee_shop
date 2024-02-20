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
        scrollView.isScrollEnabled = true
        addPadSearch()
        addLocationAvatar()
    }
    
    private func addPadSearch() {
        viewPad.backgroundColor = UIColor(named: "pad_search")
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
        viewPad.heightAnchor.constraint(equalToConstant: 300).isActive = true
        viewPad.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }
}
