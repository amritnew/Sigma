//
//  NewProfileViewController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class NewProfileViewController: UIViewController {

    let containerViewController = ContainerProfileViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView = containerViewController.view
        view.addSubview(containerView)
        setupConstraints()
        

        // Do any additional setup after loading the view.
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor,constant: 50)
            ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
