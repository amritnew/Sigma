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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}
