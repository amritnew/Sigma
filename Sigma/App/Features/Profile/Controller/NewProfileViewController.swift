//
//  NewProfileViewController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController {

    lazy var containerViewController = ContainerProfileViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView = containerViewController.view
        view.addSubview(containerView)
        setupConstraints()
    }
    
    func setupConstraints() {
        let margins = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: margins.topAnchor)
        ])
    }
    
}
