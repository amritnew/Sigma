//
//  UIView+Extension.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 12/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        views.forEach { (view) in
            addSubview(view)
        }
    }
    
    
}
