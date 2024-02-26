//
//  ItemCoffeeView.swift
//  coffee_shop
//
//  Created by TE-Member on 26/02/2024.
//

import UIKit

class ItemCoffeeView: UICollectionViewCell, UIContentView {
    
    struct Configuration: UIContentConfiguration {
        func updated(for state: UIConfigurationState) -> ItemCoffeeView.Configuration {
            return self
        }
        
        var imageCoffee: UIImage? = UIImage(systemName: "circle")
        var ratingStar: String? = ""
        var titleCoffee: String? = ""
        var descriptionCoffee: String? = ""
        var priceCoffee: String? = ""
        
        func makeContentView() -> UIView & UIContentView {
            return ItemCoffeeView(self)
        }
    }
    
    let imageView = UIImageView()
    let starView = UIImageView(image: UIImage(named: "rating_star"))
    let titleCoffee = UILabel()
    let descriptionCoffee = UILabel()
    let priceCoffee = UILabel()
    let rateCoffee = UILabel()
    
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        layer.masksToBounds = true
        layer.cornerRadius = 10
        //add image view coffee
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    var configuration: UIContentConfiguration {
        didSet {
            configure(contentConfiguration: configuration)
        }
    }
    
    func configure(contentConfiguration: UIContentConfiguration){
        guard let configuration = contentConfiguration as? ItemCoffeeView.Configuration else {
            return
        }
        //image coffee
        imageView.image = configuration.imageCoffee
        //title coffee
        titleCoffee.text = configuration.titleCoffee
        titleCoffee.textColor = .black
        titleCoffee.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        //description coffee
        descriptionCoffee.text = configuration.descriptionCoffee
        descriptionCoffee.textColor = UIColor(named: "description_coffee")
        descriptionCoffee.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        //price coffee
        priceCoffee.text = configuration.priceCoffee
        priceCoffee.textColor = .black
        priceCoffee.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        //star rating coffee
        rateCoffee.text = configuration.ratingStar
        rateCoffee.textColor = .white
        rateCoffee.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
    }
}
