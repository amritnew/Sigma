//
//  UIAlertController+Extension.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    
    static func buildAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.view.tintColor = .foreground
        alert.changeAlertBackgroundColor(color: .subBackground)
        alert.changeAlertCornerRadius(radius: 12)
        return alert
    }
    
    
    static func buildActionSheet(title: String, message: String?) -> UIAlertController {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        actionSheet.view.tintColor = .foreground
        actionSheet.changeAlertBackgroundColor(color: .subBackground)
        actionSheet.changeAlertCornerRadius(radius: 12)
        
        return actionSheet
    }
    
    func changeAlertBackgroundColor(color: UIColor) {
        guard let subview = self.view.subviews.first?.subviews.first?.subviews.first else {
            return print("No view to change background color")
        }
        subview.backgroundColor = color
    }
    
    func changeAlertCornerRadius(radius: CGFloat) {
        guard let subview = self.view.subviews.first?.subviews.first?.subviews.first else {
            return print("No view to change background color")
        }
        subview.layer.cornerRadius = radius
    }
    
    func addActions(actions: [UIAlertAction]) {
        actions.forEach { self.addAction($0) }
    }
    
}
