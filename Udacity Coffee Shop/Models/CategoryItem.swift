//
//  CategoryItem.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

struct CategoryItem {
    var title: String
    var menuItems: [MenuItem]
    
    init(title: String, menuItems: [MenuItem]) {
        self.title = title
        self.menuItems = menuItems
    }
}
