//
//  TopicController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class PostController: UIViewController, ConfigurableController {
    
    var usedView: UIView? = PostView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        
    }
}
