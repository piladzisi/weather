//
//  ViewController.swift
//  RocheCards
//
//  Created by Anna Sibirtseva on 20/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    private lazy var instructionsCard: InstructionsCardViewCarousel = {
        let cardView = InstructionsCardViewCarousel(with: .instructionsStep1)
        return cardView
    }()
    
    private lazy var instructionsCard2:  InstructionsCardViewCarousel = {
        let cardView = InstructionsCardViewCarousel(with: .instructionsStep2)
        return cardView
    }()
    
    private lazy var instructionsCard3:  InstructionsCardViewCarousel = {
        let cardView = InstructionsCardViewCarousel(with: .instructionsStep3)
        return cardView
    }()
    
    
    private var beginAssessmentButton: LargeButton = {
        let button = LargeButton(title: "Begin Assesment")
        return button
    }()
    
    private lazy var cardsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [instructionsCard, instructionsCard2, instructionsCard3])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 25
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBackgroundColor
        setupNavigationBar()
        setupLayout()
        setupConstraints()
        
    }
    
    
    private func setupLayout() {
        view.addSubviews(cardsStackView, beginAssessmentButton)
        cardsStackView.isLayoutMarginsRelativeArrangement = true
        cardsStackView.layoutMargins = .init(top: 60, left: 60, bottom: 60, right: 60)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        cardsStackView.anchor(top: safeArea.topAnchor, leading: view.leadingAnchor, bottom: beginAssessmentButton.topAnchor, trailing: view.trailingAnchor)
        
        beginAssessmentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        beginAssessmentButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -60 ).isActive = true
    }
    
}


// iPhone layout
//
//  lazy var cardView: CardView = {
//    let cardView = CardView(with: .instructionsCard1)
//    cardView.translatesAutoresizingMaskIntoConstraints = false
////    cardView.frame.origin = view.bounds.origin
////
////    cardView.center = CGPoint(x: self.view.bounds.midX,
////                                  y: self.view.bounds.midY);
//    return cardView
//  }()
//
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    setupViews()
//    setupConstraints()
//    view.backgroundColor = .yellow
//    var safeAreaHeight = view.heightAnchor
//    print(safeAreaHeight)
//  }
//
//  // MARK: - Setting Views
//  private func setupViews() {
//    view.addSubview(cardView)
//  }
//
//  // MARK: - Setting Constraints
//  private func setupConstraints() {
//    let safeArea = view.safeAreaLayoutGuide
//
//
//
//   NSLayoutConstraint.activate([
////    cardView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
////    cardView.topAnchor.constraint(equalTo: safeArea.topAnchor),
//    cardView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.8293),
//    cardView.heightAnchor.constraint(equalTo: safeArea.heightAnchor,
//                                      multiplier: 0.52586),
//    ])
//
//
//
//
//  }
