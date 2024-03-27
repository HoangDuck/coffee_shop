//
//  OrderViewController+TotalPayment.swift
//  coffee_shop
//
//  Created by TE-Member on 07/03/2024.
//

import UIKit

extension OrderViewController {
    func addTotalPayment(){
        addTitlePayment()
        addPriceItem(titleItem: "Price", priceItem: coffee?.price ?? "", priceCutItem: nil)
        addPriceItem(titleItem: "Delivery Fee", priceItem: "$ \(String(shipFeeCut))", priceCutItem: "$ \(String(shipFee))")
        divider()
        addPriceItem(titleItem: "Total Payment", priceItem: "$ \(String(format: "%.2f",calculatePriceTotal()))", priceCutItem: nil)
    }
    
    func addPriceItem(titleItem: String, priceItem: String, priceCutItem: String?){
        let item = UIView()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.widthAnchor.constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        item.heightAnchor.constraint(equalToConstant: 18).isActive = true
        let title = UILabel()
        title.text = titleItem
        title.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        title.translatesAutoresizingMaskIntoConstraints = false
        item.addSubview(title)
        title.leadingAnchor.constraint(equalTo: item.leadingAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: item.centerYAnchor).isActive = true
        
        //price
        let price = UILabel()
        price.text = priceItem
        price.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        price.translatesAutoresizingMaskIntoConstraints = false
        item.addSubview(price)
        price.trailingAnchor.constraint(equalTo: item.trailingAnchor).isActive = true
        price.centerYAnchor.constraint(equalTo: item.centerYAnchor).isActive = true
        
        //price cut
        if priceCutItem != nil {
            let priceCut = UILabel()
            priceCut.text = priceCutItem
            priceCut.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            priceCut.attributedText = NSAttributedString(
                string: priceCutItem ?? "",
                attributes: [
                    NSAttributedString.Key.strikethroughColor: UIColor.black,
                    NSAttributedString.Key.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue)
                ]
            )
            priceCut.translatesAutoresizingMaskIntoConstraints = false
            item.addSubview(priceCut)
            priceCut.centerYAnchor.constraint(equalTo: item.centerYAnchor).isActive = true
            priceCut.trailingAnchor.constraint(equalTo: price.leadingAnchor, constant: -5).isActive = true
        }
        
        orderStackView.addArrangedSubview(item)
    }
    
    func addTitlePayment(){
        let viewTitlePayment = UIView()
        viewTitlePayment.translatesAutoresizingMaskIntoConstraints = false
        viewTitlePayment.widthAnchor.constraint(equalToConstant: scrollView.frame.width - 60).isActive = true
        viewTitlePayment.heightAnchor.constraint(equalToConstant: 20).isActive = true
        let titlePayment = UILabel()
        titlePayment.text = "Payment Sumary"
        titlePayment.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titlePayment.translatesAutoresizingMaskIntoConstraints = false
        viewTitlePayment.addSubview(titlePayment)
        titlePayment.leadingAnchor.constraint(equalTo: viewTitlePayment.leadingAnchor).isActive = true
        titlePayment.topAnchor.constraint(equalTo: viewTitlePayment.topAnchor).isActive = true
        titlePayment.bottomAnchor.constraint(equalTo: viewTitlePayment.bottomAnchor).isActive = true
        orderStackView.addArrangedSubview(viewTitlePayment)
    }
}
