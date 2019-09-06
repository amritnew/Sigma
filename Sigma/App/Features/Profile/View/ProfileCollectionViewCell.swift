//
//  ProfileCollectionViewCell.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    let containerProfileViewController:ContainerProfileViewController = {
        let controller = ContainerProfileViewController()
        return controller
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        containerView = containerProfileViewController.view
        addSubview(containerView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        containerView.fillSuperview()
    }
}
