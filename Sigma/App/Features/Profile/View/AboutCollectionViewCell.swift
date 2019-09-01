//
//  AboutCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 21/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class AboutCollectionViewCell: UICollectionViewCell {
    
    let textLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce mollis tortor ullamcorper sapien eleifend faucibus. Cras malesuada lorem lectus, porttitor posuere nunc efficitur vitae. Donec laoreet arcu ligula, vitae faucibus nisi tincidunt eu. Aenean magna diam, interdum eu tincidunt et, sodales molestie elit."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(textLabel)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        textLabel.fillSuperview(padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
}
