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
        
       
        
        
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
             self.view.frame.origin.y -= self.view.frame.height / 7
        }, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            self.view.frame.origin.y += self.view.frame.height / 7       
        }, completion: nil)
    }
}
