//
//  SkillsCollectionViewCell.swift
//  Sigma
//
//  Created by Guilherme Araujo on 19/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
final class SocialCollectionViewCell : UICollectionViewCell{
    
    lazy var title: UILabel = UILabel(text: "Social", textColor: .foreground, font:.systemFont(ofSize: 15), numberOfLines: nil, lineBreakMode: nil)
    
    lazy var link: UILabel = UILabel(text: "www.link-incrivel.site.com.country", textColor: .subText, font: .systemFont(ofSize: 12), numberOfLines: nil, lineBreakMode: nil)
    
    lazy var icon = RoundableImage(frame: .zero)
    
    lazy var titleGroup: UIStackView = UIStackView(axis: .vertical, spacing: 5.0)
    

            
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SocialCollectionViewCell: ConfigurableView{
    func buildViewHierarchy() {
        addSubview(icon)
        addSubview(titleGroup)
        
    }
    
    func setupConstraints() {
    }
    
}
