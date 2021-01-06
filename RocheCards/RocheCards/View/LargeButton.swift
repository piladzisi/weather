//
//  appLargeButton.swift
//  RocheCards
//
//  Created by Anna Sibirtseva on 22/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit

class LargeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .brandRocheDarkBlue
        translatesAutoresizingMaskIntoConstraints = false
        self.frame.size = CGSize(width: 343, height: 56)
        heightAnchor.constraint(equalToConstant: 56).isActive = true
        widthAnchor.constraint(equalToConstant: 343).isActive = true
        setTitle("Begin Assessment", for: .normal)
        titleLabel?.font = UIFont(appFont: .bold, size: 28)
        roundCorners()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
