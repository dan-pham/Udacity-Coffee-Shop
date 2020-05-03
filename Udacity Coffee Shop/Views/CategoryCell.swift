//
//  CategoryCell.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

protocol MenuItemSelectionDelegate {
    func didSelectMenuItem(menuItem: MenuItem)
}

class CategoryCell: UICollectionViewCell {
    
    static let reuseID = "CategoryCell"
    
    var selectionDelegate: MenuItemSelectionDelegate!
    
    var collectionView: UICollectionView!
    var searchVCNavRef: UINavigationController?
    
    let titleLabel = UILabel(frame: .zero)
    let seeAllLabel = UILabel(frame: .zero)
    let chevronImageView = UIImageView(frame: .zero)
    
    var menuItems: [MenuItem] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String, menuItems: [MenuItem]) {
        self.titleLabel.text = title
        self.menuItems = menuItems
    }
    
    private func configure() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHorizontalFlowLayout(in: self))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MenuItemCell.self, forCellWithReuseIdentifier: MenuItemCell.reuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        seeAllLabel.translatesAutoresizingMaskIntoConstraints = false
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        
        seeAllLabel.text = "See all"
        seeAllLabel.textColor = Colors.darkGrey
        
        chevronImageView.image = SFSymbols.chevron
        chevronImageView.backgroundColor = .clear
        chevronImageView.contentMode = .scaleAspectFit
        chevronImageView.tintColor = Colors.darkGrey
        
        addSubview(collectionView)
        addSubview(titleLabel)
        addSubview(seeAllLabel)
        addSubview(chevronImageView)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalTo: topAnchor, constant: 1.5 * padding),
            chevronImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            chevronImageView.widthAnchor.constraint(equalToConstant: 20),
            chevronImageView.heightAnchor.constraint(equalToConstant: 20),
            
            seeAllLabel.centerYAnchor.constraint(equalTo: chevronImageView.centerYAnchor),
            seeAllLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor),
            seeAllLabel.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: seeAllLabel.leadingAnchor, constant: -padding),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

extension CategoryCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCell.reuseID, for: indexPath) as! MenuItemCell
        
        let menuItem = menuItems[indexPath.item]
        cell.set(menuItem: menuItem)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.item]
        selectionDelegate.didSelectMenuItem(menuItem: menuItem)
    }

}
