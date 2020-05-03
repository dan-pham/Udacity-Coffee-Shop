//
//  MenuItemDetailVC.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/2/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

class MenuItemDetailVC: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tastingNotesLabel: UILabel!
    
    @IBOutlet var incrementDecrementButtons: [UIButton]!
    @IBOutlet var addToOrderButton: UIButton!
    
    var menuItem: MenuItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuItem()
        configureIncrementDecrementButtons()
        configureAddToOrderButton()
    }
    
    func configureMenuItem() {
        title = menuItem.title
        imageView.image = menuItem.image
        descriptionLabel.text = menuItem.description
        tastingNotesLabel.text = menuItem.tastingNotes
    }

    func configureIncrementDecrementButtons() {
        for button in incrementDecrementButtons {
            button.layer.cornerRadius = 25
            button.backgroundColor = Colors.udacityBlue
            button.setTitleColor(.white, for: .normal)
        }
    }
    
    func configureAddToOrderButton() {
        addToOrderButton.layer.cornerRadius = 5
        addToOrderButton.backgroundColor = Colors.udacityBlue
        addToOrderButton.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func addToOrderButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
