//
//  LoginController+Keyboard.swift
//  Sigma
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension LoginController: UITextFieldDelegate {
    func didDimissViewAtTapped() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    func hideKeyboard() {
        if let customView = usedView as? LoginView {
            customView.loginTf.resignFirstResponder()
            customView.passwordTf.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillChangeNotification(notification: Notification) {
        
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            didDimissViewAtTapped()
        default:
            break
        }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 70
            }
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }, completion: nil)
    }
}
