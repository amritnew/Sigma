
//
//  StretchHeaderFlowLayout.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 09/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class StretchHeaderFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        if #available(iOS 11.0, *) {
            let top = UIApplication.shared.keyWindow?.safeAreaInsets.top
            self.sectionInset.top = -top!
            
        } else {
            // Fallback on earlier versions
            self.sectionInset.top = -UIApplication.shared.statusBarFrame.height
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)

        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else {return}

                let contentOffsetY = collectionView.contentOffset.y
                if contentOffsetY > 0 {
                    return
                }

                let width = collectionView.frame.width

                let height = attributes.frame.height - contentOffsetY

                //header
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })

        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
