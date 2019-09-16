//
//  TabView.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 13/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TabView: UIView {

    lazy var collectionView:UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .green
        return collection
    }()
    
    let sliderView:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        addSubview(sliderView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        collectionView.cBuilder { (make) in
            make.leading.equal(to: self.leadingAnchor)
            make.trailing.equal(to: self.trailingAnchor)
            make.top.equal(to: self.topAnchor)
            make.bottom.equal(to: self.sliderView.topAnchor)
        }
        
        sliderView.cBuilder { (make) in
            make.leading.equal(to: self.leadingAnchor)
            make.trailing.equal(to: self.trailingAnchor)
            make.bottom.equal(to: self.bottomAnchor)
        }
        sliderView.cBuild(height: 8)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
