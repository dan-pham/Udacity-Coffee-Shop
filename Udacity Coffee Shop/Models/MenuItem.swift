//
//  MenuItem.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

struct MenuItem {
    var title: String
    var price: Double
    var image: UIImage?
    var description: String?
    var tastingNotes: String?
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
    }
}
