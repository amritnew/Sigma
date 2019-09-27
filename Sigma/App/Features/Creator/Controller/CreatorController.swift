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
        (usedView as? CreatorView)?.delegate = self
    }
    
    fileprivate func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}

extension CreatorController: CreatorViewDelegate {
    func didTappedToPost() {
        navigationController?.present(UINavigationController(rootViewController: NewPostController(comeFrom: .postToTrail, trailViewModel: nil)), animated: true, completion: nil)
    }
    
    func didTappedToTrail() {
        navigationController?.present(UINavigationController(rootViewController: NewTrailController()), animated: true, completion: nil)
    }
}
