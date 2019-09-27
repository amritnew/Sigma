//
//  ConfigurableController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 23/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ConfigurableController: UIViewController {
    var usedView: UIView? { get set }
    func setupView()
    func addSubView()
    func setupConstraints()
}

extension ConfigurableController {
    func setupView() {
        addSubView()
        setupConstraints()
    }
    func addSubView() {
        guard let myView = usedView else {return print("You should pass view")}
        self.view.addSubview(myView)
    }
    func setupConstraints() {
        if let myView = usedView {
            myView.cBuild(make: .fillSuperview)
        }
    }
}
