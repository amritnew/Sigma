//
//  ListTrailCollectionCell.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 12/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListTrailCollectionCell: UICollectionViewCell, ConfigurableView {
    
    let trailImage: UIImageView = {
        let image = RoundableImage(frame: .zero)
        image.image = UIImage(named: "gallery")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 65).isActive = true
        return image
    }()
    
    let trailName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Swift: The Basics"
        label.textColor = .black
        return label
    }()
    
    let trailPublisher: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Published by: @Crhis Lattner"
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([trailImage,trailName, trailPublisher])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            trailImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            trailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            trailImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            trailName.leadingAnchor.constraint(equalTo: trailImage.trailingAnchor, constant: 20),
            trailName.topAnchor.constraint(equalTo: trailImage.topAnchor, constant: 5),
            
            
            trailPublisher.topAnchor.constraint(equalTo: trailName.bottomAnchor, constant: 5),
            trailPublisher.leadingAnchor.constraint(equalTo: trailName.leadingAnchor)
            
            
            
            
            ])
    }
    
}
