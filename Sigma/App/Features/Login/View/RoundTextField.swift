//
//  RoundTextField.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//


import UIKit

class RoundTextField: UITextField {
    
    convenience init(placeHolder: String) {
        self.init(frame: .zero)
        self.placeholder = placeHolder
    }
    

    override func layoutSubviews() {
           didSetupLayout()
    }
    
    fileprivate func didSetupLayout() {
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = .white
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        self.layer.borderWidth = 2
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
    }
    
    
}
