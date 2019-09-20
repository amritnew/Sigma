//
//  SettingsCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 19/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class SettingsCells:UICollectionViewCell,Reusable,ConfigurableView {
    
    private let label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([label])
    }
    
    func setupConstraints() {
        label.cBuild(make: .fillSuperview)
    }
    
    func setupView(withString string:String) {
        label.text = string
    }
}
