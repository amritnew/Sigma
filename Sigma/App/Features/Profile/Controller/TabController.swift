//
//  TabController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TabController: BaseCollectionController {
    
    weak var delegate:TabControllerDelegate?
    
    var itensTab:[String] = []
    
    init(itensTab:[String]) {
        super.init()
        self.itensTab = itensTab
        self.collectionView.backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
}

extension TabController: UICollectionViewDelegateFlowLayout {
    
    
    fileprivate func setupCollection() {
        collectionView.register(TabCollectionCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = .white
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = CGSize(width: 1, height: 1)
            layout.minimumLineSpacing = 16
        }
    }
        
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let option = OptionsProfile(rawValue: indexPath.row) else {return}
        delegate?.tappedInOption(optionProfile: option)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itensTab.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? TabCollectionCell
        cell?.labelCell.text = itensTab[indexPath.row]
        cell?.backgroundColor = UIColor.white
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 16, height: collectionView.frame.height)
        
//        let text = itensTab[indexPath.row] as NSString
//
//        return text.size(withAttributes: nil)
    }
}

class TabCollectionCell: UICollectionViewCell {
  
    let labelCell:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(labelCell)
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContraints() {
        
        NSLayoutConstraint.activate(labelCell.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0))
        
    }
}
