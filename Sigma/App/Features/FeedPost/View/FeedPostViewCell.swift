//
//  FeedPostView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FeedPostViewCell: UICollectionViewCell, ConfigurableView, Reusable {
    
    var feedPostViewModel: FeedPostViewModel? {
        didSet {
            if let feedVm = feedPostViewModel {
                titlePost.text = feedVm.posts?[feedVm.row].title
                authorPost.text = "Published by: @\(feedVm.posts?[feedVm.row].provisionalAuthor ?? "")"
            }
        }
    }
    
    
    let imagePost: RoundableImage = {
        let imageView = RoundableImage(frame: .zero)
        imageView.image = UIImage(named: "gallery")
        imageView.widthAnchor.constraint(equalToConstant: 65).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        return imageView
    }()
    
    let titlePost = UILabel(text: "Teste de Label gigante só para ver se quebra linha.", textColor: .black, font: .boldSystemFont(ofSize: 20), numberOfLines: 0, lineBreakMode: nil)

    let authorPost = UILabel(text: "Bergamora Matheus", textColor: .subText, font: nil, numberOfLines: nil, lineBreakMode: nil)
    
    let progress = UILabel(text: "10 / 10", textColor: .subText, font: .systemFont(ofSize: 15), numberOfLines: nil, lineBreakMode: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buildViewHierarchy() {
        addSubviews([imagePost, titlePost, authorPost, progress])
    }
    
    func setupConstraints() {
        imagePost.cBuild(make: .centerYInSuperView)
        
        imagePost.cBuilder { (make) in
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            
        }
        
        titlePost.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 5)
            make.leading.equal(to: imagePost.trailingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
        authorPost.cBuilder { (make) in
            make.top.equal(to: titlePost.bottomAnchor, offsetBy: 5)
            make.leading.equal(to: titlePost.leadingAnchor)
            make.bottom.equal(to: bottomAnchor, offsetBy: -5)
        }
        
        progress.cBuilder { (make) in
            make.top.equal(to: authorPost.topAnchor)
            make.trailing.equal(to: titlePost.trailingAnchor)
        }
        
        
    }
}
