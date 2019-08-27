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
        guard let option = OptionProfile(rawValue: indexPath.row) else {return}
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
        
        let text = itensTab[indexPath.row] as NSString
           
        return text.size(withAttributes: nil)
//        guard let cell = collectionView.cellForItem(at: indexPath) as? TabCollectionCell else {
//            return CGSize.zero
//        }
//        
//        let label = cell.labelCell
//        guard let font = label.font else {
//            return CGSize.zero
//        }
//        
//        let height = label.font.lineHeight
//        
//        let width = itensTab[indexPath.row].widthWithConstrainedHeight(height, font: font)
//        
//        return CGSize(width: width, height: height)
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
        labelCell.anchorWithConstantsToTop(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 4, rightConstant: -4)
    }
}
