//
//  LoginView.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func didSignUpTapped()
    func didSignIn(result: Bool)
}

class LoginView: UIView, ConfigurableView {
   
    let imageBanner: UIImageView = {
       let image = UIImageView(image: UIImage(named: "banner"))
       image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/3).isActive = true // Magic number to test
       return image
    }()
    
    let message = UILabel(text: "Welcome", textColor: .white, font: UIFont.boldSystemFont(ofSize: 56), numberOfLines: 0, lineBreakMode: nil)
    
    let loginTf: RoundTextField = {
        let roundTextField = RoundTextField(placeHolder: "E-mail")
        roundTextField.keyboardType = UIKeyboardType.emailAddress
        return roundTextField
    }()
    
    let passwordTf: RoundTextField = {
       let roundTextField = RoundTextField(placeHolder: "Password")
       roundTextField.isSecureTextEntry = true
       return roundTextField
    }()
    
    let messageAccount = UILabel(text: "Dont have an account", textColor: .lightGray, font: UIFont(name: "Arial", size: 14), numberOfLines: nil, lineBreakMode: nil)
    
    lazy var loginButton: RoundButton = {
       let roundButton = RoundButton(textButton: "Login")
       roundButton.addTarget(self, action: #selector(didSignIn), for: .touchUpInside)
       return roundButton
    }()
    
    lazy var signUp: UILabel = {
        let signUp = UILabel(text: "Sign Up", textColor: .actionColor, font: UIFont(name: "Arial", size: 14), numberOfLines: nil, lineBreakMode: nil)
        signUp.isUserInteractionEnabled = true
        signUp.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didSignUpTapped)))
        return signUp
    }()
    
    weak var delegate: LoginViewDelegate?
    
    let loginViewModel = LoginViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageBanner, message, loginTf, passwordTf, messageAccount, loginButton, signUp])
    }
    
    func setupConstraints() {
        imageBanner.cBuilder { (make) in
            make.top.equal(to: topAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor)
            make.trailing.equal(to: trailingAnchor)
        }
        message.cBuilder { (make) in
            make.top.equal(to: imageBanner.bottomAnchor, offsetBy: 0)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
        }
        
        loginTf.cBuilder { (make) in
            make.top.equal(to: message.bottomAnchor, offsetBy: 50)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
        
        passwordTf.cBuilder { (make) in
            make.top.equal(to: loginTf.bottomAnchor, offsetBy: 20)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
        
        loginButton.cBuilder { (make) in
            make.top.equal(to: passwordTf.bottomAnchor, offsetBy: 30)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)

        }
        
        messageAccount.cBuilder { (make) in
            make.top.equal(to: loginButton.bottomAnchor, offsetBy: 20)
        }
        
        messageAccount.cBuild(make: .centerXInSuperView)
        
        signUp.cBuilder { (make) in
            make.top.equal(to: messageAccount.bottomAnchor, offsetBy: 10)
        }
        signUp.cBuild(make: .centerXInSuperView)
    }
}

extension LoginView {
    @objc func didSignUpTapped() {
        self.delegate?.didSignUpTapped()
    }
    
    @objc func didSignIn(result: Bool) {
        loginViewModel.loginAuth(withEmail: loginTf.text, withPassword: passwordTf.text) { (result) in
            self.delegate?.didSignIn(result: result)
        }
    }
}

