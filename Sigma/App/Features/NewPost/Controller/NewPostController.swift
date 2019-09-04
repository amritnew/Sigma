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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "Foreground") ?? .white]
        navigationController?.navigationBar.barTintColor = UIColor(named: "Background")
        navigationController?.navigationBar.tintColor = .init(red: 255/255, green: 69/255, blue: 58/255, alpha: 1)
        setupBarButtons()
    }
    
    fileprivate func setupBarButtons(previewing: Bool = false) {
        if previewing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeBarButtonDidPressed))
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Post", style: .plain, target: self, action: #selector(postBarButtonDidPressed))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBarButtonDidPressed))
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Preview", style: .plain, target: self, action: #selector(previewBarButtonDidPressed))
        }
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
        setupBarButtons(previewing: true)
        (usedView as? NewPostView)?.previewBarButtonDidPressed()
    }
    
    @objc func closeBarButtonDidPressed() {
        setupBarButtons()
        (usedView as? NewPostView)?.closePreviewBarButtonDidPressed()
    }
    
    @objc func postBarButtonDidPressed() {
        (usedView as? NewPostView)?.postBarButtonDidPressed()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            (usedView as? NewPostView)?.keyboardWillShow(keyboardRect: keyboardRect)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        (usedView as? NewPostView)?.dismissKeyboard()
    }
    
}
