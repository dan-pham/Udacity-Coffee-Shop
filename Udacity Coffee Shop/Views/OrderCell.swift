//
//  OrderCell.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    
    static let reuseID = "OrderCell"
    
    let priceLabel = UILabel(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: OrderCell.reuseID)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(orderItem: MenuItem) {
        textLabel?.text = orderItem.title
        priceLabel.text = "1 x $\(orderItem.price)"
    }
    
    private func configure() {
        accessoryType = .disclosureIndicator
        
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            priceLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
