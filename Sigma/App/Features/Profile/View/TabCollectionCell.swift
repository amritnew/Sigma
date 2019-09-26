//
//  TabCollectionCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TabCollectionCell: UICollectionViewCell,ConfigurableView, Reusable {
    
    let labelCell:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(font: Font.boldSystem, size: 16)
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.subTitleGray
        return label
    }()
    
    override var isSelected: Bool {
        willSet(newValue) {
            labelCell.textColor = newValue ? UIColor.actionColor : UIColor.subTitleGray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .subBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([labelCell])
    }
    
    func setupConstraints() {
//        labelCell.cBuild(make: .centerYInSuperView)
//        labelCell.cBuilder { (make) in
//            make.leading.equal(to: self.leadingAnchor, offsetBy: 8)
//            make.trailing.equal(to: self.trailingAnchor, offsetBy: -8)
//            make.height.equal(to: self.heightAnchor)
//        }
        NSLayoutConstraint.activate([
            labelCell.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelCell.topAnchor.constraint(equalTo: self.topAnchor,constant: self.frame.height/2)
            ])
    }
}
