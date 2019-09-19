//
//  SkillsCollectionViewCell.swift
//  Sigma
//
//  Created by Guilherme Araujo on 19/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
final class SocialCollectionViewCell : UICollectionViewCell{
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SocialCollectionViewCell: ConfigurableView{
    func buildViewHierarchy() {
        <#code#>
    }
    
    func setupConstraints() {
        <#code#>
    }
    
}
