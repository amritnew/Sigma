//
//  NewPostController.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

enum ComeFrom {
    case postToTrail
    case newToTrail
}

class NewPostController: UIViewController, ConfigurableController {
    
    var usedView: UIView? = NewPostView()
    
    var comeFrom: ComeFrom?

    var trailViewModel = TrailViewModel(trail: Trail(title: "", description: "", author: "", topics: nil))
    
    convenience init(comeFrom: ComeFrom, trailViewModel: TrailViewModel?) {
        self.init()
        self.comeFrom = comeFrom
        self.trailViewModel = trailViewModel ?? TrailViewModel(trail: Trail(title: "", description: "", author: "", topics: nil))
    }
    
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
        navigationController?.navigationBar.barTintColor = .subBackground
        navigationController?.navigationBar.tintColor = .actionColor
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
        (usedView as? NewPostView)?.dismissKeyboard()
        setupBarButtons(previewing: true)
        (usedView as? NewPostView)?.previewBarButtonDidPressed()
    }
    
    @objc func closeBarButtonDidPressed() {
        setupBarButtons()
        (usedView as? NewPostView)?.closePreviewBarButtonDidPressed()
    }
    
    @objc func postBarButtonDidPressed() {
        let alert = UIAlertController(title: "Type your post title", message: nil, preferredStyle: .alert)
        var actionTextField = UITextField()
        alert.addTextField(configurationHandler: { actionTextField = $0 })
        alert.addActions(actions: [
            UIAlertAction(title: "Post", style: .default) { _ in self.postToSave(title: actionTextField.text ?? "") },
            UIAlertAction(title: "Cancel", style: .destructive) { _ in print("Cancel Pressed") }
            ])
        present(alert, animated: true, completion: nil)
    }
    
    
    private func postToSave(title: String) {
        (usedView as? NewPostView)?.postBarButtonDidPressed(title: title, comeFrom: comeFrom!, trailViewModel: trailViewModel) { result in
            let alert = UIAlertController(title: "Posted", message: nil, preferredStyle: .alert)
            let ctrlToDismiss = result ? self : alert
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                ctrlToDismiss.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        }
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
