//
//  CreatorController.swift
//  Sigma
//
//  Created by aluno on 26/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CreatorController: UIViewController, ConfigurableController {
    var usedView: UIView? = CreatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}
