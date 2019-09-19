//
//  ContainerRowCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 11/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ContainerRowCollectionViewCell: UICollectionViewCell,ConfigurableView {
    
//    lazy var collection:UICollectionView = {
//        let listTrailsController = ListTrailsController()
//        let collection = listTrailsController.collectionView
//        listTrailsController.scrollDelegate = self
//        return collection!
//    }()
    
    var collection:UICollectionView!
    
    weak var scrollDelegate: CustomScrollDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    convenience init(withCollectionController controller:BaseCollectionController) {
        self.init(frame: .zero)
        collection = controller.collectionView
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        collection.cBuild(make: .fillSuperview)
    }
    func buildViewHierarchy() {
        addSubviews([collection])
    }
}

extension ContainerRowCollectionViewCell: CustomScrollDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewDidScroll?(scrollView)
    }
}
