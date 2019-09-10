//
//  MenuBarCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 10/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    let menuBar = TabController(itensTab: ["Option1","Optiasdfon2","Optioasdflkmnn3"])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        menuBar.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuBar.view)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        if let viewMenuBar = menuBar.view {
            NSLayoutConstraint.activate([
                viewMenuBar.leadingAnchor.constraint(equalTo: leadingAnchor),
                viewMenuBar.trailingAnchor.constraint(equalTo: trailingAnchor),
                viewMenuBar.bottomAnchor.constraint(equalTo: bottomAnchor),
                viewMenuBar.topAnchor.constraint(equalTo: topAnchor,constant: 8)
                ])
        }
        
        
    }
}
