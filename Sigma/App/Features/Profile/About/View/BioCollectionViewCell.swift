//
//  BioCollectionViewCell.swift
//  Sigma
//
//  Created by Guilherme Araujo on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

final class BioCollectionViewCell : UIView {
    
    lazy var bioDescription:UILabel = UILabel(text: "Your amazing story", textColor: .subText, font: .systemFont(ofSize: 15), numberOfLines: 0, lineBreakMode: nil)

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension BioCollectionViewCell: ConfigurableView {
    func buildViewHierarchy() {
        addSubview(bioDescription)
    }
    
    func setupConstraints() {
        
        bioDescription.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 5)
            make.leading.equal(to: leadingAnchor, offsetBy: 5)
            make.trailing.equal(to: trailingAnchor, offsetBy: -5)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
    }
    
}
