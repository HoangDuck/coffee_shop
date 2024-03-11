//
//  DeliveryTrackingViewController.swift
//  coffee_shop
//
//  Created by TE-Member on 07/03/2024.
//

import UIKit

class DeliveryTrackingViewController: UIViewController {
    
    let stackView: UIStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        setupUI()
    }
    
    private func setupUI(){
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: view.topAnchor,constant: 10).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        addBarSheetView()
        timeLeftView()
        deliveryToSomeoneView()
        progressPercentDeliveryView()
        titleDeliveryView()
        avatarDriverView()
    }
    
    func avatarDriverView() {
        stackView.addArrangedSubview(UIView())
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 54).isActive = true
        let width = self.view.frame.width - 60
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        //avatar
        let imageAvatarView = UIImageView(image: UIImage(named: "avatar_2"))
        imageAvatarView.layer.masksToBounds = true
        imageAvatarView.layer.cornerRadius = 17
        imageAvatarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageAvatarView)
        imageAvatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageAvatarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageAvatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //title
        let title = UILabel()
        title.text = "Johan Hawn"
        title.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.leadingAnchor.constraint(equalTo: imageAvatarView.trailingAnchor, constant: 10).isActive = true
        title.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        
        //description
        let description = UILabel()
        description.text = "Personal Courier"
        description.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        description.textColor = UIColor(named: "options")
        description.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(description)
        description.leadingAnchor.constraint(equalTo: imageAvatarView.trailingAnchor, constant: 10).isActive = true
        description.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        //button call
        let buttonCall = UIButton()
        buttonCall.setImage(UIImage(named: "telpon"), for: .normal)
        buttonCall.layer.masksToBounds = true
        buttonCall.layer.cornerRadius = 17
        buttonCall.layer.borderWidth = 1
        buttonCall.layer.borderColor = UIColor(named: "border_button")?.cgColor
        buttonCall.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonCall)
        buttonCall.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        buttonCall.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        buttonCall.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonCall.heightAnchor.constraint(equalTo: buttonCall.widthAnchor).isActive = true
        
        stackView.addArrangedSubview(view)
    }
    
    func deliveryToSomeoneView() {
        let stackViewDelivery = UIStackView()
        stackViewDelivery.axis = .horizontal
        stackViewDelivery.spacing = 0
        stackViewDelivery.alignment = .center
        stackViewDelivery.distribution = .equalSpacing
        let deliveryTo = UILabel()
        deliveryTo.text = "Delivery to "
        deliveryTo.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        deliveryTo.textColor = UIColor(named: "options")
        stackViewDelivery.addArrangedSubview(deliveryTo)
        let nameDriver = UILabel()
        nameDriver.text = "Jl. Kpg Sutoyo"
        nameDriver.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        nameDriver.textColor = .black
        stackViewDelivery.addArrangedSubview(nameDriver)
        stackView.addArrangedSubview(stackViewDelivery)
    }
    
    func progressPercentDeliveryView(){
        let stackProgressView = UIStackView()
        stackProgressView.translatesAutoresizingMaskIntoConstraints = false
        stackProgressView.widthAnchor.constraint(equalToConstant: stackView.frame.width - 60.0).isActive = true
        stackProgressView.heightAnchor.constraint(equalToConstant: 5).isActive = true
        stackProgressView.axis = .horizontal
        stackProgressView.distribution = .fillEqually
        stackProgressView.spacing = 10
        stackProgressView.alignment = .center
        stackProgressView.addArrangedSubview(barProgressView(color: UIColor(named: "progress_finish_bar")!))
        stackProgressView.addArrangedSubview(barProgressView(color: UIColor(named: "progress_finish_bar")!))
        stackProgressView.addArrangedSubview(barProgressView(color: UIColor(named: "progress_finish_bar")!))
        stackProgressView.addArrangedSubview(barProgressView(color: UIColor(named: "progress_unfinish_bar")!))
        stackView.addArrangedSubview(stackProgressView)
    }
    
    func titleDeliveryView() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 90).isActive = true
        let width = self.view.frame.width - 60
        view.widthAnchor.constraint(equalToConstant: width).isActive = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor(named: "border_minus")?.cgColor
        view.layer.borderWidth = 1
        //configure icon view
        let iconView = UIView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconView)
        iconView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        iconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 10
        iconView.layer.borderColor = UIColor(named: "border_minus")?.cgColor
        iconView.widthAnchor.constraint(equalToConstant: 62).isActive = true
        iconView.heightAnchor.constraint(equalToConstant: 62).isActive = true
        iconView.layer.borderWidth = 1
        let imageIconView = UIImageView(image: UIImage(named: "bike"))
        imageIconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.addSubview(imageIconView)
        imageIconView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor).isActive = true
        imageIconView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        //title view
        let title = UILabel()
        title.text = "Delivered your order"
        title.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        title.textColor = .black
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.topAnchor.constraint(equalTo: iconView.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 10).isActive = true
        //description view
        let description = UILabel()
        description.text = "We deliver your goods to you in the shortes possible time."
        description.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        description.numberOfLines = 2
        description.textColor = UIColor(named: "options")
        description.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(description)
        description.topAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        description.leadingAnchor.constraint(equalTo: iconView.trailingAnchor,constant: 10).isActive = true
        description.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        stackView.addArrangedSubview(view)
    }
    
    func barProgressView(color: UIColor) -> UIView {
        let viewBar = UIView()
        viewBar.backgroundColor = color
        viewBar.layer.masksToBounds = true
        viewBar.layer.cornerRadius = 2
        viewBar.translatesAutoresizingMaskIntoConstraints = false
        viewBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        viewBar.widthAnchor.constraint(equalToConstant: 72).isActive = true
        return viewBar
    }
    
    func timeLeftView(){
        let timesLeft = UILabel()
        timesLeft.text = "10 minutes left"
        timesLeft.textColor = .black
        timesLeft.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        stackView.addArrangedSubview(timesLeft)
    }
    
    func addBarSheetView(){
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 44).isActive = true
        view.heightAnchor.constraint(equalToConstant: 5).isActive = true
        view.backgroundColor = UIColor(named: "border_minus")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        stackView.addArrangedSubview(view)
    }
}
