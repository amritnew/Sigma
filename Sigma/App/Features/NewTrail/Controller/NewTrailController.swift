//
//  NewTrailController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class NewTrailController: UIViewController, ConfigurableController {
    var usedView: UIView? = NewTrailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigation()
        navigationItem.title = "New Trail"
        
    }
    
    
    fileprivate func  setupNavigation() {
        navigationController?.navigationBar.barTintColor = UIColor(named: "Subackground")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Arial", size: 22)!]
      
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: nil)
        
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
        
        rightBarButton.tintColor = .red
        leftBarButton.tintColor = .red
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
}
