//
//  ContainerRowCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 11/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ContainerRowCollectionViewCell: UICollectionViewCell {
    lazy var collection:UICollectionView = {
        let listTrailsController = ListTrailsController()
        let collection = listTrailsController.collectionView
        listTrailsController.scrollDelegate = self
        return collection!
    }()
    
    weak var customScroll: CustomScrollDelegate?
    
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

extension ContainerRowCollectionViewCell: CustomScrollDelegate {
    func scrollDidScroll(withOffset offset: CGPoint) {
        customScroll?.scrollDidScroll(withOffset: offset)
    }
}
