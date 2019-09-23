//
//  LoginController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class LoginController: UIViewController, ConfigurableController {
    var usedView: UIView? = LoginView()
    var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        setupObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    fileprivate func bindViewModel() {
        (usedView as? LoginView)?.delegate = self
    }
}

extension LoginController: LoginViewDelegate {
    func didSignIn(result: Bool) {
        
    }
    
    func didSignUpTapped() {
        navigationController?.pushViewController(RegisterController(), animated: true)
    }
}
