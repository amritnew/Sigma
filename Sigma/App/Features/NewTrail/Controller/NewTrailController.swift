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
        navigationController?.navigationBar.barTintColor = .subBackground
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.99598068, green: 0.9961469769, blue: 0.9959587455, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Arial", size: 22)!]
      
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePost))
        
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
    
    @objc func savePost() {
        if let customView = usedView as? NewTrailView {
            let nameTrail = customView.nameTrail.text
            let descriptionTrail = customView.descriptionTrail.text
            
            print("\(String(describing: nameTrail)) \(String(describing: descriptionTrail))")
            // Here make trail
        }
    }
    
    @objc func didDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
