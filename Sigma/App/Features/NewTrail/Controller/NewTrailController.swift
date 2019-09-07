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
    
    let imagePickerController = UIImagePickerController()
    var imageAlbum: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        setupNavigation()
        setupObserver()
    }
    
    fileprivate func bindViewModel() {
        if let customView = usedView as? NewTrailView {
            customView.delegate = self
        }
    }
    
    fileprivate func setupNavigation() {
        navigationItem.title = "New Trail"
        navigationController?.navigationBar.barTintColor = UIColor(named: "Subackground")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Arial", size: 22)!]
      
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTrail))
        
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didDismiss))
        
        rightBarButton.tintColor = .red
        leftBarButton.tintColor = .red
        navigationItem.rightBarButtonItem = rightBarButton
        navigationItem.leftBarButtonItem = leftBarButton
    }
}

extension NewTrailController: NewTrailViewDelegate {
    func didImageTapped() {
        presentImagePickerOptions()
    }
    
    @objc func saveTrail() {
        (usedView as? NewTrailView)?.rightBarButtonDidPress(completion: { (_) in})
        
        
    }
    
    @objc func didDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
