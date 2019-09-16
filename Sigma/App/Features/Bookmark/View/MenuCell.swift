//
//  MenuCell.swift
//  Sigma
//
//  Created by Matheus Damasceno on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell, Reusable {
    
    let titleCell: UILabel = {
        let label = UILabel()
        label.text = "TRAILS"
        label.textColor = .foreground
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            titleCell.textColor = isSelected ? .foreground : .subText
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
        if(indexPath == 0) {
            titleCell.text = "Trails"
        } else {
            titleCell.text = "Posts"
        }
        
        
    }
    
    
    
}
