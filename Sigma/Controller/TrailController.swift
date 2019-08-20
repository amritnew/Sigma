//
//  TrailController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 13/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class TrailController: BaseCollectionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension TrailController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(popView))
        collectionView.backgroundColor = .white
        collectionView.register(cellType: TopicCollectionViewCell.self)
        collectionView.register(supplementaryViewType: ListTrailCollectionHeader.self, ofKind: UICollectionView.elementKindSectionHeader)
    }
    
    @objc fileprivate func popView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, for: indexPath, viewType: ListTrailCollectionHeader.self)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 500)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: TopicCollectionViewCell.self)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(TopicController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 75)
    }
}
