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
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        feedPostViewModel.updateList = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension FeedPostController: UICollectionViewDelegateFlowLayout {
    func setupCollection() {
        collectionView.backgroundColor = .subBackground
        collectionView.register(cellType: FeedPostViewCell.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedPostViewModel.numberOfRows()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let postController = PostController(post: feedPostViewModel.getPost(atRow: indexPath.row))
        navigationController?.pushViewController(postController, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: FeedPostViewCell.self)
        let cellVM = feedPostViewModel.cellViewModel(forIndex: indexPath.row)
        cell.setup(viewModel: cellVM)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width, height: 75)
    }
}
