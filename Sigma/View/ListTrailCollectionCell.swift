//
//  ListTrailCollectionCell.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 12/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListTrailCollectionCell: UICollectionViewCell, ConfigurableView {
    
    let trailName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Swift: The Basics"
        label.textColor = .white
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
        addSubViews([trailName])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            trailName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            trailName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
            ])
    }
    
}
