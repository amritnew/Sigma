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
        if #available(iOS 13.0, *) {
                 let appearence = UINavigationBarAppearance()
                 appearence.backgroundColor = #colorLiteral(red: 0.08235294118, green: 0.1215686275, blue: 0.262745098, alpha: 1)
                 appearence.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                 appearence.titleTextAttributes = [.foregroundColor: UIColor.white]
                 navigationController?.navigationBar.standardAppearance = appearence
                 navigationController?.navigationBar.scrollEdgeAppearance = appearence
             } else {
                 navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.08235294118, green: 0.1215686275, blue: 0.262745098, alpha: 1)
                 navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                 navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
             }
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
