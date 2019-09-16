//
//  MenuBarCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 10/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {
    var menuBar: TabController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        menuBar = TabController(itensTab: ["Boa", "Alan", "Boa"])
        menuBar?.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(menuBar!.view)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        if let viewMenuBar = menuBar!.view {
            NSLayoutConstraint.activate([
                viewMenuBar.leadingAnchor.constraint(equalTo: leadingAnchor),
                viewMenuBar.trailingAnchor.constraint(equalTo: trailingAnchor),
                viewMenuBar.bottomAnchor.constraint(equalTo: bottomAnchor),
                viewMenuBar.topAnchor.constraint(equalTo: topAnchor)
                ])
        }
        
        
    }
}
