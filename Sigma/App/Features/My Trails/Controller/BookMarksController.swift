//
//  MyTrailsController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 13/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class BookMarksController: BaseCollectionController {
    
    let bookMarkViewModel = BookMarkViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        }
    
    fileprivate func bindViewModel() {
        bookMarkViewModel.updateList = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindViewModel()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
    }
    
}
extension BookMarksController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        collectionView.backgroundColor = UIColor(named: "Subackground")
        collectionView.register(cellType: BookmarksCell.self)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(TrailController(), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookMarkViewModel.numberOfRows()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: BookmarksCell.self)
        let cellVM = bookMarkViewModel.cellViewModel(forIndex: indexPath.row)
        cell.setup(viewModel: cellVM)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 75)
    }
}
