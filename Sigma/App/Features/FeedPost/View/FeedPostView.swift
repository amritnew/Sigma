//
//  FeedPostView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FeedPostView: UICollectionViewCell, ConfigurableView, Reusable {
    
    var feedPostViewModel: FeedPostViewModel? {
        didSet {
            if let feedVm = feedPostViewModel {
                titlePost.text = feedVm.posts?[feedVm.row].title
                authorPost.text = feedVm.posts?[feedVm.row].provisionalAuthor
            }
        }
    }
    
    let imagePost: RoundableImage = {
        let imageView = RoundableImage(frame: .zero)
        imageView.image = UIImage(named: "gallery")
        imageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        return imageView
    }()
    
    let titlePost = UILabel(text: "Swift", textColor: .white, font: nil, numberOfLines: nil, lineBreakMode: nil)
    
    let authorPost = UILabel(text: "Published by: @Vinicius", textColor: .lightGray, font: nil, numberOfLines: nil, lineBreakMode: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        addSubviews([imagePost, titlePost, authorPost])
    }
    
    func setupConstraints() {
        imagePost.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 5)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
        
        titlePost.cBuilder { (make) in
            make.top.equal(to: imagePost.topAnchor, offsetBy: 5)
            make.leading.equal(to: imagePost.trailingAnchor, offsetBy: 10)
        }
        
        authorPost.cBuilder { (make) in
            make.top.equal(to: titlePost.bottomAnchor, offsetBy: 5)
            make.leading.equal(to: titlePost.leadingAnchor)
        }
        
        
    }
}
