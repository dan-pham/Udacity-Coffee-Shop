//
//  PayVC.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/1/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

class PayVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var leftRightButtons: [UIButton]!
    @IBOutlet var payButton: UIButton!
    
    var orderItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureTableView()
        configureLeftRightButtons()
        configurePayButton()
        configureSampleOrders()
    }
    
    @IBAction func payButtonTapped(_ sender: Any) {
        let checkoutVC = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutVC") as! CheckoutVC
        present(checkoutVC, animated: true)
    }
    
    func configureNavBar() {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = Colors.udacityBlue

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    func configureTableView() {
        tableView.register(OrderCell.self, forCellReuseIdentifier: OrderCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureLeftRightButtons() {
        for button in leftRightButtons {
            button.layer.cornerRadius = 25
            button.backgroundColor = Colors.udacityBlue
            button.tintColor = .white
        }
    }
    
    func configurePayButton() {
        payButton.layer.cornerRadius = 5
        payButton.backgroundColor = Colors.udacityBlue
        payButton.setTitleColor(.white, for: .normal)
    }
    
    func configureSampleOrders() {
        let cappuccino: MenuItem = MenuItem(title: "Cappuccino", price: 7.99)
        let peachTranquility: MenuItem = MenuItem(title: "Peach Tranquility", price: 5.99)
        let earlGreyTea: MenuItem = MenuItem(title: "Earl Grey Tea", price: 5.99)
        
        orderItems = [cappuccino, peachTranquility, earlGreyTea]
    }
    
}

extension PayVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseID, for: indexPath) as! OrderCell
        
        let orderItem = orderItems[indexPath.row]
        cell.set(orderItem: orderItem)
        
        return cell
    }
    
}
