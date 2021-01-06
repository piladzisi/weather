//
//  InstructionCardView.swift
//  RocheCards
//
//  Created by Anna Sibirtseva on 21/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit

final class InstructionsCardViewMUD: UIView {
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.setBottomBorder()
        label.font = UIFont(appFont: .bold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return label
    }()
    
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(appFont: .regular, size: 32)
       label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private lazy var instructionsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [stepLabel, instructionsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 18
        return stackView
    }()
    
    private lazy var cardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, instructionsStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    public convenience init(with type: InstructionsType) {
        self.init(frame: .zero)
        configureCard(with: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cardCornerRadius
        layer.backgroundColor = UIColor.white.cgColor
        layer.shadowColor = UIColor.appShadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: shadowRadius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = 1
    }
    
    private func setupViews() {
        addSubview(cardStackView)
        cardStackView.fillSuperview()
        cardStackView.isLayoutMarginsRelativeArrangement = true
        cardStackView.layoutMargins = .init(top: 10, left: 0, bottom: 20, right: 30)
    }
}

// MARK: - View Configuration

extension InstructionsCardViewMUD {
    public func configureCard(with type: InstructionsType) {
        let model = InstructionsModel.getInstructionsDetails(for: .instructionsStep1)
        imageView.image = UIImage(named: model.imageName)
        instructionsLabel.text = model.instruction
        stepLabel.text = model.step
        
    }
}


