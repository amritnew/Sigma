//
//  CardView.swift
//  Sigma
//
//  Created by aluno on 26/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CardView: UIView, ConfigurableView {
   
    
    
    fileprivate let titleLabel = UILabel(text: "", textColor: .white, font: UIFont.boldSystemFont(ofSize: 16), numberOfLines: 0, lineBreakMode: nil)
    
    fileprivate let messageLabel = UILabel(text: "", textColor: .lightGray, font: nil, numberOfLines: 0, lineBreakMode: .byWordWrapping)
    
    convenience init(title: String, messsage: String, icon: UIImage) {
        self.init(frame: .zero)
        titleLabel.text = title
        messageLabel.text = messsage
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViewHierarchy()
        setupConstraints()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        self.backgroundColor = .subBackground
            let radius: CGFloat = 10
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true

            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            self.layer.shadowRadius = 3.0
            self.layer.shadowOpacity = 0.5
            self.layer.masksToBounds = false
            self.layer.cornerRadius = radius
    }
    
    func buildViewHierarchy() {
           addSubviews([titleLabel, messageLabel])
    }
       
    func setupConstraints() {
        titleLabel.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 10)
        }
        titleLabel.cBuild(make: .centerXInSuperView)
        
        messageLabel.cBuilder { (make) in
            make.top.equal(to: titleLabel.bottomAnchor, offsetBy: 10)
            make.leading.equal(to: leadingAnchor, offsetBy: 10)
            make.trailing.equal(to: trailingAnchor, offsetBy: -10)
        }
        
      
        
        
        
        
    }
}
