//
//  SearchVC.swift
//  Udacity Coffee Shop
//
//  Created by Dan Pham on 5/1/20.
//  Copyright © 2020 Dan Pham. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var collectionView: UICollectionView!
    
    var categories: [CategoryItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureSearchController()
        configureCollectionView()
        configureSampleCategories()
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
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchBar.searchTextField.backgroundColor = .systemBackground
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createVerticalFlowLayout(in: view))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
    }
    
    func configureSampleCategories() {
        var peachTranquility: MenuItem = MenuItem(title: "Peach Tranquility", price: 5.99)
        peachTranquility.image = Images.peachTranquility
        peachTranquility.description = "Sweet fusion of peach and candied pineapple with a spritz of lemon."
        peachTranquility.tastingNotes = "Bright floral taste with hints of peach."
        
        var cappuccino: MenuItem = MenuItem(title: "Cappuccino", price: 7.99)
        cappuccino.image = Images.cappuccino
        cappuccino.description = "Dark, rich espresso with a thick milk foam."
        cappuccino.tastingNotes = "Lightly acidic coffee with a touch of chocolate."
        
        var earlGreyTea: MenuItem = MenuItem(title: "Earl Grey Tea", price: 5.99)
        earlGreyTea.image = Images.earlGreyTea
        earlGreyTea.description = "Strong black tea base with essence of bergamot."
        earlGreyTea.tastingNotes = "Subtle lemon and floral lavender."
        
        var coffeeFlight: MenuItem = MenuItem(title: "Coffee Flight", price: 19.99)
        coffeeFlight.image = Images.coffeeFlight
        coffeeFlight.description = "Mixed flight of 8 different coffees ranging from dark, rich espressos to nutty, creamy cappuccinos."
        coffeeFlight.tastingNotes = "Tasting notes vary."
        
        var blackCoffee: MenuItem = MenuItem(title: "Black Coffee", price: 5.99)
        blackCoffee.image = Images.blackCoffee
        blackCoffee.description = "Dark, rich espresso."
        blackCoffee.tastingNotes = "Lightly acidic coffee."
        
        var jasmineTea: MenuItem = MenuItem(title: "Jasmine Tea", price: 4.99)
        jasmineTea.image = Images.jasmineTea
        jasmineTea.description = "Low-caffeine, light green tea."
        jasmineTea.tastingNotes = "Subtly floral."
        
        let favorites = CategoryItem(title: "Your Favorites", menuItems: [peachTranquility, cappuccino, earlGreyTea])
        
        let coffees = CategoryItem(title: "Coffees", menuItems: [cappuccino, coffeeFlight, blackCoffee])
        
        let teas = CategoryItem(title: "Teas", menuItems: [earlGreyTea, peachTranquility, jasmineTea])
        
        categories = [favorites, coffees, teas]
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destVC = segue.destination as! MenuItemDetailVC
//        destVC.menuItem = sender as? MenuItem
//    }
    
}

extension SearchVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseID, for: indexPath) as! CategoryCell
        
        let categoryItem = categories[indexPath.item]
        cell.set(title: categoryItem.title, menuItems: categoryItem.menuItems)
        cell.selectionDelegate = self
        
        return cell
    }
    
}

extension SearchVC: MenuItemSelectionDelegate {
    
    func didSelectMenuItem(menuItem: MenuItem) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuItemDetailVC") as! MenuItemDetailVC
        detailVC.menuItem = menuItem
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
