//
//  ContainerCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 09/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ContainerCollectionViewCell: UICollectionViewCell {
    let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isPagingEnabled = true
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        setupContraints()
        setupCollection()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContraints() {
        collectionView.fillSuperview(padding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    func setupCollection() {
        collectionView.register(ContainerRowCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
}

extension ContainerCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}
