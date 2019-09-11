//
//  ContainerRowCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 11/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class ContainerRowCollectionViewCell: UICollectionViewCell {
    let collection:UICollectionView = {
        let listTrailsController = ListTrailsController()
        let collection = listTrailsController.collectionView
        return collection!
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collection)
        setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        collection.fillSuperview()
    }
}
