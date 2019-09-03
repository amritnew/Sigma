//
//  NewTrailView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol NewTrailViewDelegate: class {
    func didImageTapped()
}

class NewTrailView: UIView, ConfigurableView {
    
    lazy var imageTrail: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "gallery"), for: .normal)
        button.addTarget(self, action: #selector(didImageTapped), for: .touchUpInside)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    fileprivate let nameLabel = UILabel(text: "Write your name:", textColor: .white, font: UIFont(name: "Arial", size: 15), numberOfLines: 1, lineBreakMode: nil)
    
    let nameTrail: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        textField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        return textField
    }()
    
    fileprivate let descriptionLabel = UILabel(text: "Write your description:", textColor: .white, font: UIFont(name: "Arial", size: 15), numberOfLines: 1, lineBreakMode: nil)
    
    
    let descriptionTrail: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.heightAnchor.constraint(equalToConstant: 200).isActive = true
        textField.sizeToFit()
        return textField
    }()
    
    weak var delegate: NewTrailViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        self.backgroundColor = UIColor(named: "Subackground")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageTrail,nameLabel, nameTrail, descriptionLabel, descriptionTrail])
    }
    
    func setupConstraints() {
        imageTrail.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 100)
        }
        imageTrail.cBuild(make: .centerXInSuperView)
        
        nameLabel.cBuilder { (make) in
            make.top.equal(to: imageTrail.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
        nameTrail.cBuilder { (make) in
            make.top.equal(to: nameLabel.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
        descriptionLabel.cBuilder { (make) in
            make.top.equal(to: nameTrail.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
        descriptionTrail.cBuilder { (make) in
            make.top.equal(to: descriptionLabel.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
             make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
    }
}

extension NewTrailView {
    @objc func didImageTapped() {
        delegate?.didImageTapped()
    }
}
