//
//  ViewController.swift
//  Stimuli Layout
//
//  Created by Anna Sibirtseva on 30/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit

class StimuliViewController: UIViewController {

    let stimuliView: UIView = {
        let view = UIView()
        view.frame.size.height = 50
        view.frame.size.width = 50
        view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(stimuliView)
        print(view.frame.width)
//        stimuliView.heightAnchor.constraint(equalToConstant: 20).isActive = true
//         stimuliView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stimuliView.centerInSuperview(size: CGSize(width: 100, height: 100))
       // stimuliView.frame.size.width = 50
        
    }

    
}

