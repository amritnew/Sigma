//
//  ViewController+HideKey+Extension.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension NewTrailController: UITextFieldDelegate {
 
    func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeNotification(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeNotification(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeNotification(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func hideKeyboard() {
        if let customView = usedView as? NewTrailView {
            customView.descriptionTrail.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillChangeNotification(notification: Notification) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
             self.view.frame.origin.y -= self.view.frame.height / 7
        }, completion: nil)
       
    }
    
    
}
