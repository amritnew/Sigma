//
//  TabCollectionCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TabCollectionCell: UICollectionViewCell {
    
    let labelCell:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelCell)
        setupContraints()
        self.backgroundColor = .actionColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContraints() {
        labelCell.centerYInSuperview()
        labelCell.cBuilder { (make) in
            make.leading.equal(to: self.leadingAnchor, offsetBy: 8)
            make.trailing.equal(to: self.trailingAnchor, offsetBy: -8)
        }
    }
}
