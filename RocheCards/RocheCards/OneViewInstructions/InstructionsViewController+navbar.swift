//
//  ViewController+navbar.swift
//  RocheCards
//
//  Created by Anna Sibirtseva on 22/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit

extension InstructionsViewController {
    
    
    func setupNavigationBar(){
        navigationItem.title = "SDH Vision Assessment"
        setupNavBarAppearance()
        setupLeftNavItems()
        setupRightNavItems()
    }
    
    private func setupLeftNavItems() {
        let backNavButton = UIButton(type: .system)
        backNavButton.setImage(#imageLiteral(resourceName: "Right Small").withRenderingMode(.alwaysOriginal), for: .normal)
        
        let hamburgerButton = UIButton(type: .system)
        hamburgerButton.setImage(#imageLiteral(resourceName: "Hamburger Icon").withRenderingMode(.alwaysOriginal), for: .normal)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backNavButton), UIBarButtonItem(customView: hamburgerButton)]
    }
    
    private func setupRightNavItems(){
         let moreButton = UIButton(type: .system)
            moreButton.setImage(#imageLiteral(resourceName: "More Icon").withRenderingMode(.alwaysOriginal), for: .normal)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: moreButton)
    }
    
    private func setupNavBarAppearance(){
         guard let navController = self.navigationController else {
                   print("Navigation Controller is nil")
                   return
               }

               let attributes =  [NSAttributedString.Key.font: UIFont(appFont: .bold , size: 28)]
               navController.navigationBar.titleTextAttributes = attributes
               navController.navigationBar.backgroundColor = .white
               navController.navigationBar.isTranslucent = false
    }
    
}
