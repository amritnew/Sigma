//
//  BookmarkContentCell.swift
//  Sigma
//
//  Created by Matheus Damasceno on 16/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class BookmarkContentCell: UICollectionViewCell, Reusable, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    lazy var bookmarkCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .subBackground
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
        bookmarkCollection.register(cellType: BookmarksCell.self)
        bookmarkCollection.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollection() {
        addSubview(bookmarkCollection)
        NSLayoutConstraint.activate([
            bookmarkCollection.topAnchor.constraint(equalTo: topAnchor),
            bookmarkCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            bookmarkCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            bookmarkCollection.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bookmarkCollection.dequeueReusableCell(for: indexPath, cellType: BookmarksCell.self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: frame.width, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}
