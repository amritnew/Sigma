//
//  NewPostController.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class NewPostController: UIViewController, ConfigurableController {
    
    var usedView: UIView? = NewPostView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        bindViewModel()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "Foreground") ?? .white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
        navigationController?.navigationBar.tintColor = .init(red: 255/255, green: 69/255, blue: 58/255, alpha: 1)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonDidPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(previewBarButtonDidPressed))
    }
    
    fileprivate func bindViewModel() {
        if let view = usedView as? NewPostView {
            navigationItem.title = view.viewModel.viewTitle
        }
    }
    
    @objc func cancelBarButtonDidPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func previewBarButtonDidPressed() {
        if let view = usedView as? NewPostView {
            let postCtrl = PostController(post: view.getPostFromTextView())
            navigationController?.pushViewController(postCtrl, animated: true)
        }
    }
    
}
