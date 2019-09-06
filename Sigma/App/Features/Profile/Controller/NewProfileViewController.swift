//
//  NewProfileViewController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController {

    lazy var containerViewController:ContainerProfileViewController = {
        let controller = ContainerProfileViewController()
        controller.delegateScrollView = self
        return controller
    }()
    
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var heightConstraintHeader:CGFloat = self.view.frame.height * 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView = containerViewController.view
        view.addSubview(headerView)
        view.addSubview(containerView)
        setupConstraints()
        
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupConstraints() {
        let margins = view.safeAreaLayoutGuide
        
        let heightConstraint = headerView.heightAnchor.constraint(equalToConstant: heightConstraintHeader)
        heightConstraint.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            headerView.topAnchor.constraint(equalTo: margins.topAnchor),
            headerView.bottomAnchor.constraint(equalTo: containerView.topAnchor),
            heightConstraint,

            
            containerView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: margins.bottomAnchor)
        ])
    }
}

extension NewProfileViewController: CustomScrollDelegate {
    func scrollViewDidScroll(withContentOffset contentOffset: CGPoint) {
        
        let contentOffsetY = contentOffset.y
        let width = self.view.frame.width
        let height = headerView.frame.height - contentOffsetY
        
        headerView.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
        
        
//        let newHeight = heightConstraintHeader - (contentOffset.y)
//        let width = view.frame.width
//        
//        
//        headerProfile.frame = CGRect(x: 0.0, y: view.safeAreaLayoutGuide.layoutFrame.minY, width: width, height: newHeight)
//        heightConstraintHeader = newHeight
//        let newConstraint = headerProfile.heightAnchor.constraint(equalToConstant: newHeight)
//        newConstraint.priority = .defaultHigh
//        newConstraint.isActive = true
    }
}
