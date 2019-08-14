//
//  ListTrailCollectionHeader.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 12/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


protocol ListTrailHeaderDelegate: class {
    func imageHeaderDidClick()
}

class ListTrailCollectionHeader: UICollectionReusableView, ConfigurableView{
  
    let tagHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Swift"
        label.textColor = .orange
        return label
    }()
    
    let titleHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Basic Swift, Learning the new things about the awesome language"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let publisherHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Published by: @Crhis Lattner"
        label.textColor = .lightGray
        return label
    }()
    
    let imageHeader: UIImageView = {
        let image = RoundableImage(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "swift")
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageHeaderDidClick(_:)))
        image.addGestureRecognizer(tapGesture)
        return image
    }()
    
    
    weak var delegate: ListTrailHeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
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

extension ListTrailCollectionHeader {
    @objc func imageHeaderDidClick(_ gesture: UITapGestureRecognizer) {
        delegate?.imageHeaderDidClick()
    }
}
