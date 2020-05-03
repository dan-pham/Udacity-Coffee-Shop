//
//  CheckoutVC.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/3/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

class CheckoutVC: UIViewController {
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func configureButtons() {
        closeButton.layer.cornerRadius = 25
        closeButton.backgroundColor = Colors.udacityBlue
        closeButton.setTitleColor(.white, for: .normal)
        
        doneButton.layer.cornerRadius = 5
        doneButton.backgroundColor = Colors.udacityBlue
        doneButton.setTitleColor(.white, for: .normal)
    }
    
}
