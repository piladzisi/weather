//
//  IllustrationCardStackView.swift
//  RocheCards
//
//  Created by Anna Sibirtseva on 20/01/2020.
//  Copyright © 2020 Anna Sibirtseva. All rights reserved.
//

import UIKit


final class InstructionsCardViewCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "illustration1"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Instruction"
        label.font = UIFont(appFont: .bold, size: 16)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        return label
    }()
    private lazy var separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.grayscaleLightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return view
    }()
    
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Hold device 12-14 \ninches away"
        label.font = UIFont(appFont: .regular, size: 32)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var instructionsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textLabel, separatorLineView, instructionsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var cardStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, textLabel, separatorLineView, instructionsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
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
        cardStackView.layoutMargins = .init(top: 26, left: 26, bottom: 26, right: 26)
        
    }
}

// MARK: - View Configuration

extension InstructionsCardViewCell {
    public func configureCard(with type: InstructionsType) {
        let model = InstructionsModel.getInstructionsDetails(for: type)
        imageView.image = UIImage(named: model.imageName)
        instructionsLabel.text = model.instruction
    }
    
}

