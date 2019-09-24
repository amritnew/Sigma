//
//  RegisterView.swift
//  Sigma
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol RegisterViewDelegate {
    func didImageChoose()
    func didMakeRegister(result: Bool)
}

class RegisterView: UIView, ConfigurableView {
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
    
    lazy var roundImage: RoundedImage = {
       let roundImage = RoundedImage(image: UIImage(named: "profille"))
       roundImage.contentMode = UIView.ContentMode.scaleAspectFit
       roundImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
       roundImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
       roundImage.isUserInteractionEnabled = true
        roundImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didImageChoose)))
       return roundImage
    }()
    
    lazy var registerButton: RoundButton = {
        let roundButton = RoundButton(textButton: "Sign Up")
        roundButton.addTarget(self, action: #selector(didMakeRegister), for: .touchUpInside)
        return roundButton
    }()
    
    var imageAlbum: UIImage?
    
    let registerViewModel = RegisterViewModel()
    
    var delegate: RegisterViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.backgroundColor = .subBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([roundImage, loginTf, passwordTf, registerButton])
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
        
        registerButton.cBuilder { (make) in
            make.top.equal(to: passwordTf.bottomAnchor, offsetBy: 30)
            make.leading.equal(to: leadingAnchor, offsetBy: 20)
            make.trailing.equal(to: trailingAnchor, offsetBy: -20)
        }
    }
}

extension RegisterView {
    @objc func didMakeRegister(result: Bool) {
            registerViewModel.register(withEmail: loginTf.text, withPassword: passwordTf.text) { (result) in
                guard let image = self.imageAlbum else {self.delegate?.didMakeRegister(result: result); return}
                let data = DataHandler.transform(image: image)
                self.registerViewModel.createReferenceImage(withImageData: data)
                self.delegate?.didMakeRegister(result: result)
        }
    }
    
    @objc func didImageChoose() {
        delegate?.didImageChoose()
    }
}
