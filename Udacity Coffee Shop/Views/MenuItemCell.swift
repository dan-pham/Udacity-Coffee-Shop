//
//  MenuItemCell.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

class MenuItemCell: UICollectionViewCell {
    
    static let reuseID = "MenuItemCell"
    
    let imageView = UIImageView(frame: .zero)
    let titleLabel = UILabel(frame: .zero)
    let priceLabel = UILabel(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(menuItem: MenuItem) {
        titleLabel.text = menuItem.title
        priceLabel.text = "$\(menuItem.price)"
        imageView.image = menuItem.image
    }
    
    private func configure() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 5
        backgroundColor = Colors.udacityBlue
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor = .white
        
        priceLabel.textAlignment = .right
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        priceLabel.textColor = .white
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -padding),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
