//
//  MenuCell.swift
//  Sigma
//
//  Created by Matheus Damasceno on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell {
    
    let titleCell: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textColor = .subText
        label.font = UIFont(font: Font.boldSystem, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            titleCell.textColor = isSelected ? .actionColor : .subText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        setupTitleCell()
    }
    
    func setupTitleCell() {
        addSubview(titleCell)
        NSLayoutConstraint.activate([
            titleCell.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleCell.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTitleText(_ indexPath: Int) {
        if indexPath == 0 {
            titleCell.text = "TRAILS"
        } else {
            titleCell.text = "POSTS"
        }
        
        
    }
    
    
    
}
