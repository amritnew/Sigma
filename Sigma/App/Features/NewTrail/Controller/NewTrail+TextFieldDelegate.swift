//
//  ViewController+HideKey+Extension.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension NewTrailController: UITextFieldDelegate {
 
    func didDimissViewAtTapped() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return false
    }
    
    func hideKeyboard() {
        if let customView = usedView as? NewTrailView {
            customView.descriptionTrail.resignFirstResponder()
            customView.nameTrail.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillChangeNotification(notification: Notification) {
        
        switch notification.name.rawValue {
        case "UIKeyboardWillShowNotification":
            didDimissViewAtTapped()
        default:
            print("")
        }
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 100
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
