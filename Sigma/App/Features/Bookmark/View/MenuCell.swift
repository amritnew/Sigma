//
//  MenuCell.swift
//  Sigma
//
//  Created by Matheus Damasceno on 14/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class MenuCell: UICollectionViewCell, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
