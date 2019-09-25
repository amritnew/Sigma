//
//  UIStackView+Extension.swift
//  Sigma
//
//  Created by Guilherme Araujo on 25/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat){
        self.init()
        self.frame = .zero
        self.axis = axis
        self.distribution = .fillEqually
        self.spacing = spacing
    }
}
