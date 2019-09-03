//
//  NewBlogController.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class NewBlogController: UIViewController, ConfigurableController {
    
    var usedView: UIView? = NewBlogView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        
    }
    
    fileprivate func bindViewModel() {
        if let view = usedView as? NewBlogView {
            navigationItem.title = view.viewModel?.viewTitle
        }
    }
    
}
