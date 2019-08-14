//
//  TrailCollectionViewCell.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TopicCollectionViewCell: UICollectionViewCell, ConfigurableView {
  
    let topicImage: UIImageView = {
        let image = RoundableImage(frame: .zero)
        image.image = UIImage(named: "gallery")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 65).isActive = true
        return image
    }()
    
    let topicName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How to declare Generics in Swift"
        label.textColor = .black
        return label
    }()
    
    let topicPublisher: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Class 1"
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
        addSubviews([topicImage,topicName, topicPublisher])
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate( [
            topicImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            topicImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            topicImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            topicName.leadingAnchor.constraint(equalTo: topicImage.trailingAnchor, constant: 20),
            topicName.topAnchor.constraint(equalTo: topicImage.topAnchor, constant: 5),
            
            
            topicPublisher.topAnchor.constraint(equalTo: topicName.bottomAnchor, constant: 5),
            topicPublisher.leadingAnchor.constraint(equalTo: topicName.leadingAnchor)
            
            ])
        
    }
}
