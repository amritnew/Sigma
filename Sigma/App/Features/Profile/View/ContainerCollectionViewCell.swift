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
    
    let containerViewModel = ContainerViewModel()
    
    weak var scrollDelegate: CustomScrollDelegate?
    
    weak var profileDelegate: ProfileDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(collectionView)
        setupCollection()
        setupConstraints()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        collectionView.cBuild(make: .fillSuperview)
    }
    
    func setupCollection() {
        collectionView.register(cellType: SettingsView.self)
//        collectionView.register(cellType: ContainerRowCollectionViewCell.self)
    }
    
}

extension ContainerCollectionViewCell: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return containerViewModel.numberOfItens()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = containerViewModel.cellForItem(collectionView, cellForItemAt: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}

extension ContainerCollectionViewCell: CustomScrollDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewDidScroll?(scrollView)
    }
}

extension ContainerCollectionViewCell: ContainerActionsDelegate {
    func tappedInSettings(withOption option: SettingsOptions) {
        profileDelegate?.presentModally(viewController: containerViewModel.instantiateViewController(fromSettingsOption: option))
    }
}
