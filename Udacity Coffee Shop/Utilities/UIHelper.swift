//
//  UIHelper.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

enum UIHelper {
    
    static func createHorizontalFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let itemWidth = width / 3
        let padding: CGFloat = 8
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
    static func createVerticalFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let height = view.bounds.height
        let itemHeight = height / 4
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: width, height: itemHeight)
        return flowLayout
    }
    
}
