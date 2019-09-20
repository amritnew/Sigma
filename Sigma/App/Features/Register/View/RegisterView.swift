//
//  RegisterView.swift
//  Sigma
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class RegisterView: UIView, ConfigurableView {
   
    
    let loginTf = RoundTextField(placeHolder: "E-mail")
    
    let passwordTf = RoundTextField(placeHolder: "Password")
    
    
    let roundImage: RoundedImage = {
       let roundImage = RoundedImage(image: UIImage(named: "gallery"))
       roundImage.contentMode = UIView.ContentMode.scaleAspectFit
       roundImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
       roundImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
       return roundImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .subBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([roundImage, loginTf, passwordTf])
    }
    
    func setupConstraints() {
        roundImage.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 150)
        }
        roundImage.cBuild(make: .centerXInSuperView)
        

        loginTf.cBuilder { (make) in
            make.top.equal(to: roundImage.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
        
        passwordTf.cBuilder { (make) in
            make.top.equal(to: loginTf.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
    }
    
    
}
