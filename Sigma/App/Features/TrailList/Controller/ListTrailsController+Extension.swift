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
        collectionView.backgroundColor = .subBackground
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trailViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 500)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, viewType: ListTrailCollectionHeader.self)
        headerView.delegate = self
        let trailsHeaderVM = trailViewModel.cellViewModel(forIndex: 1)
        headerView.setup(viewModel: trailsHeaderVM)
        return headerView
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ListTrailCollectionCell.self)
        let cellVM = self.trailViewModel.cellViewModel(forIndex: indexPath.row)
        cell.setup(viewModel: cellVM)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(TrailController(trail: trailViewModel.getTrail(forIndex: indexPath.row)), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 75)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollDidScroll(withOffset: scrollView.contentOffset)
    }
}

extension ListTrailsController: ListTrailHeaderDelegate {
    func imageHeaderDidClick() {
        self.navigationController?.pushViewController(TrailController(), animated: true)
    }
}
