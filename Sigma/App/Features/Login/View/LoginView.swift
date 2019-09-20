//
//  LoginView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class LoginView: UIView, ConfigurableView {
   
    let imageBanner: UIImageView = {
       let image = UIImageView(image: UIImage(named: "banner"))
       image.heightAnchor.constraint(equalToConstant: 400).isActive = true
       return image
    }()
    
    let message = UILabel(text: "Welcome", textColor: .black, font: UIFont.boldSystemFont(ofSize: 56), numberOfLines: 0, lineBreakMode: nil)
    
    
    let loginTf: UITextField = {
       let textField = UITextField()
       textField.backgroundColor = .black
       return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageBanner, message, loginTf])
    }
    
    func setupConstraints() {
        imageBanner.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor)
            make.trailing.equal(to: trailingAnchor)
        }
        message.cBuilder { (make) in
            make.top.equal(to: imageBanner.bottomAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
        }
        
        loginTf.cBuilder { (make) in
            make.top.equal(to: message.bottomAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
        
    }
}
