//
//  TrailController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 13/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class TrailController: BaseCollectionController {
    
    var trailViewModel = TrailViewModel(trail: Trail(title: "", description: "", author: "", topics: nil))
    
    convenience init(trail: Trail) {
        self.init()
        trailViewModel = TrailViewModel(trail: trail)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension TrailController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        navigationController?.navigationBar.tintColor = .actionColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.shadowImage = UIImage()
        collectionView.backgroundColor = .subBackground
        collectionView.register(cellType: TrailCollectionViewCell.self)
        collectionView.register(supplementaryViewType: TrailHeaderView.self, ofKind: UICollectionView.elementKindSectionHeader)
    }
    
    @objc fileprivate func popView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, viewType: TrailHeaderView.self)
        header.setup(viewModel: trailViewModel)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 500)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trailViewModel.numberOfRows()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: TrailCollectionViewCell.self)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(PostController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 75)
    }
}
