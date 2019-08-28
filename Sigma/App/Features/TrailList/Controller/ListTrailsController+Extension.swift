//
//  ListTrailsController+Extension.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 26/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension ListTrailsController: UICollectionViewDelegateFlowLayout {
    
    func setupCollection() {
        collectionView.register(cellType: ListTrailCollectionCell.self)
        collectionView.register(supplementaryViewType: ListTrailCollectionHeader.self, ofKind: UICollectionView.elementKindSectionHeader)
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trailViewModel.trails?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 500)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, viewType: ListTrailCollectionHeader.self)
        headerView.trailsViewModel = self.trailViewModel
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ListTrailCollectionCell.self)
        self.trailViewModel.row = indexPath.row
        cell.trailsViewModel = self.trailViewModel
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(TrailController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 75)
    }
}
