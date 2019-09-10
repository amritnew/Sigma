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
    
    let newTrailViewModel = NewTrailViewModel()
    
    lazy var imageTrail: UIImageView = {
        let image = UIImageView(image: UIImage(named: "gallery-1"))
        image.contentMode = UIView.ContentMode.scaleAspectFit
        image.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didImageTapped))
        tapGestureRecognizer.numberOfTapsRequired = 1
        image.addGestureRecognizer(tapGestureRecognizer)
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        return image
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
        self.backgroundColor = .subBackground
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
    
    func rightBarButtonDidPress(completion: @escaping (Bool) -> Void) {
        newTrailViewModel.saveTrail(title: nameTrail.text!, description: descriptionTrail.text!, completion: {
            completion($0)
        })
    }
    
}
