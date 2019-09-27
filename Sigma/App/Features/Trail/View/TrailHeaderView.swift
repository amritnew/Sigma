//
//  TrailHeaderView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 10/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TrailHeaderView: UICollectionReusableView, ConfigurableView, Reusable {
    
    let tagHeader = UILabel(text: "Swift", textColor: .orange,font: nil, numberOfLines: nil, lineBreakMode: nil)
    let publisherHeader = UILabel(text: "Published by: @Chris Lattner", textColor: .subTitleColor, font: nil, numberOfLines: nil, lineBreakMode: nil)
    let titleHeader = UILabel(text: "Basic Swift, Learning the new things about the awesome language", textColor: .white, font: UIFont.systemFont(ofSize: 22), numberOfLines: 2, lineBreakMode: .byWordWrapping)
    
    lazy var imageHeader: UIImageView = {
        let image = RoundableImage(frame: .zero)
        image.image = UIImage(named: "gallery")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = .backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([tagHeader, publisherHeader, titleHeader,imageHeader])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            tagHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            tagHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            
            titleHeader.leadingAnchor.constraint(equalTo: tagHeader.leadingAnchor),
            titleHeader.topAnchor.constraint(equalTo: tagHeader.bottomAnchor, constant: 10),
            titleHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            publisherHeader.leadingAnchor.constraint(equalTo: tagHeader.leadingAnchor),
            publisherHeader.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: 10),
            
            imageHeader.topAnchor.constraint(equalTo: publisherHeader.bottomAnchor, constant: 10),
            imageHeader.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageHeader.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageHeader.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            ])
    }
}

extension TrailHeaderView {
    func setup(viewModel: TrailViewModel) {
        titleHeader.text = viewModel.title
        publisherHeader.text = "Published By: @\(viewModel.author)"
    }
}
