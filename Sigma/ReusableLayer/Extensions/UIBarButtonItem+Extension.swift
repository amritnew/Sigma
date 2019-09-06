//
//  UIBarButtonItem+Extension.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


extension UIBarButtonItem {
    
    convenience init(title: String, titleColor: UIColor, target: Any?, action: Selector) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        self.init(customView: button)
    }
    
}
