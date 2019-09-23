//
//  RegisterController.swift
//  Sigma
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class RegisterController: UIViewController, ConfigurableController {
    var usedView: UIView? = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = .background
        navigationController?.navigationBar.tintColor = .actionColor
    }
}
