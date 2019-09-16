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
    
    lazy var menuBar: MenuTabBarView = {
        let menu = MenuTabBarView()
        menu.translatesAutoresizingMaskIntoConstraints = false
        menu.bookMarkController = self
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupMenuBar()
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
        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.isHidden = false
    }
    
    fileprivate func setupMenuBar() {
        view.addSubview(menuBar)
        NSLayoutConstraint.activate([
            menuBar.topAnchor.constraint(equalTo: collectionView.topAnchor),
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuBar.heightAnchor.constraint(equalToConstant: 30)
            
            ])
    }
    
    func scrollToMenuIndex(_ index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .init(), animated: true)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        menuBar.menuCollectionView.selectItem(at: indexPath, animated: true, scrollPosition: .init())
    }
    
}
extension BookMarksController: UICollectionViewDelegateFlowLayout {
    
    fileprivate func setupCollection() {
        collectionView.backgroundColor = UIColor(named: "Subackground")
        collectionView.register(cellType: BookmarksCell.self)
        collectionView.isPagingEnabled = true
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        navigationController?.pushViewController(PostController(post: bookMarkViewModel.performPostAtFavorite(forIndex: indexPath.row)), animated: true)
//    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: BookmarksCell.self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
