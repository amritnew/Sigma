//
//  ViewController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 31/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListTrailsController: BaseCollectionController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension ListTrailsController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        navigationController?.navigationBar.isHidden = true
        collectionView.register(ListTrailCollectionCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.register(ListTrailCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 500)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
        return headerView
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ListTrailCollectionCell
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 50)
    }
}
