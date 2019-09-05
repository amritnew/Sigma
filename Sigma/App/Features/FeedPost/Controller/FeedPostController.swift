//
//  FeedPostController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FeedPostController: BaseCollectionController {
    
    var feedPostViewModel = FeedPostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        feedPostViewModel.fetchPosts { (posts) in
            self.feedPostViewModel.posts = posts
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension FeedPostController: UICollectionViewDelegateFlowLayout {
    func setupCollection() {
        collectionView.backgroundColor = UIColor(named: "SubBackground")
        collectionView.register(cellType: FeedPostView.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedPostViewModel.posts?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: FeedPostView.self)
        self.feedPostViewModel.row = indexPath.row
        cell.feedPostViewModel = feedPostViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 75)
    }
}
