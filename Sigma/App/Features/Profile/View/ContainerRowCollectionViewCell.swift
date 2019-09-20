//
//  ContainerRowCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 11/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ContainerRowCollectionViewCell: UICollectionViewCell,ConfigurableView,Reusable {
    
//    lazy var collection:UICollectionView = {
//        let listTrailsController = ListTrailsController()
//        let collection = listTrailsController.collectionView
//        listTrailsController.scrollDelegate = self
//        return collection!
//    }()
    
    private var collection:UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    weak var scrollDelegate: CustomScrollDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
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
    
    public func setCollection(withController controller:BaseCollectionController) {
        if let collectionView = controller.collectionView {
            self.collection.delegate = controller
            self.collection.dataSource = controller
        }
    }
}

extension ContainerRowCollectionViewCell: CustomScrollDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewDidScroll?(scrollView)
    }
}
