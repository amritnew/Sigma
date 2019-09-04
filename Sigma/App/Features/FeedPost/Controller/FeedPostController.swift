//
//  FeedPostController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FeedPostController: BaseCollectionController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension FeedPostController: UICollectionViewDelegateFlowLayout {
    func setupCollection() {
        collectionView.backgroundColor = UIColor(named: "SubBackground")
        collectionView.register(cellType: FeedPostView.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: FeedPostView.self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 75)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 0, right: 0)
    }
    
}
