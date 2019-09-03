//
//  ProfileCollectionHeader.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class HeaderProfileCollection: UICollectionReusableView, ConfigurableView {
    weak var delegate:HeaderProfileDelegate?
    
    let profileCoverPhoto:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "swift")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profilePhoto: UIImageView = {
        let imageView = CircleImageView(frame: .zero)
        imageView.image = UIImage(named: "gallery")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let profileEditLabel: UILabel = {
        let label = UILabel()
        label.text = "Edit Profile"
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(font: .mediumSystem, size: 12)
       
        return label
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome Lindo"
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(font: .boldSystem, size: 20)
        return label
    }()
    
    let collectionSelection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = UIColor.blue
        return collection
    }()
    
    let tabView = TabController(itensTab: ["About","PreferredLanguage"])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tabView.delegate = self
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func buildViewHierarchy() {
        tabView.view.translatesAutoresizingMaskIntoConstraints = false
        addSubviews([profileCoverPhoto,profilePhoto,profileEditLabel,profileNameLabel, tabView.view])
        
    }
   
    func setupConstraints() {
        
        let constraint = profileCoverPhoto.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        
        constraint.priority = UILayoutPriority(250)
        
        NSLayoutConstraint.activate([
            profileCoverPhoto.topAnchor.constraint(equalTo: self.topAnchor),
            profileCoverPhoto.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileCoverPhoto.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            constraint,
            
            profilePhoto.centerYAnchor.constraint(equalTo: profileCoverPhoto.bottomAnchor),
            profilePhoto.centerXAnchor.constraint(equalTo: profileCoverPhoto.centerXAnchor),
            profilePhoto.widthAnchor.constraint(equalTo: profileCoverPhoto.widthAnchor, multiplier: 0.4),
            profilePhoto.heightAnchor.constraint(equalTo: profilePhoto.widthAnchor),
            
            profileEditLabel.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor,constant: 8),
            profileEditLabel.centerXAnchor.constraint(equalTo: profileCoverPhoto.centerXAnchor),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileEditLabel.bottomAnchor, constant: 4),
            profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tabView.view.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor),
            tabView.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tabView.view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tabView.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tabView.view.heightAnchor.constraint(equalToConstant: 32)
            ])
        
        
    }
}

extension HeaderProfileCollection: TabControllerDelegate {
    func tappedInOption(optionProfile: OptionsProfile) {
        delegate?.wasSelectedOption(option: optionProfile)
    }
}
