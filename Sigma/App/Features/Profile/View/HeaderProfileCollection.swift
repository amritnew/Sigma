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
        label.textColor = UIColor.subTitleGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(font: .mediumSystem, size: 12)
       
        return label
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome Lindo"
        label.textColor = UIColor.titleWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(font: .boldSystem, size: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.subBackground
        
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func buildViewHierarchy() {
        addSubviews([profileCoverPhoto,profilePhoto,profileEditLabel,profileNameLabel])
        
    }
   
    func setupConstraints() {
        
        let constraint = profileCoverPhoto.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        constraint.priority = UILayoutPriority.defaultHigh
        
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
            profileEditLabel.heightAnchor.constraint(equalToConstant: 12),
            
            profileNameLabel.topAnchor.constraint(equalTo: profileEditLabel.bottomAnchor, constant: 4),
            profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            profileNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
}

extension HeaderProfileCollection: TabControllerDelegate {
    func tappedInOption(optionProfile: OptionsProfile) {
        delegate?.wasSelectedOption(option: optionProfile)
    }
}
