//
//  BioCollectionViewCell.swift
//  Sigma
//
//  Created by Guilherme Araujo on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
final class BioCollectionViewCell : UICollectionViewCell {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var bioDescription:UILabel = UILabel(text: "Your amazing story", textColor: .foreground, font: .systemFont(ofSize: 15), numberOfLines: 0, lineBreakMode: nil)
    
    
}

extension BioCollectionViewCell: ConfigurableView {
    func buildViewHierarchy() {
        addSubview(bioDescription)
    }
    
    func setupConstraints() {
        bioDescription.cBuild(top: topAnchor, costantTop: 5.0, bottom: bottomAnchor, constantBottom: -5.0, left: leftAnchor, constantLeft: 5.0, right: rightAnchor, constantRight: -5.0)
    }
    
}
