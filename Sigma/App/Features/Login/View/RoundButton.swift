//
//  RoundButton.swift
//  Sigma
//
//  Created by aluno on 20/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
  
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Action", for: .normal)
        self.titleLabel?.textColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        didSetupLayout()
    }
    
    fileprivate func didSetupLayout() {
        self.layer.cornerRadius = self.frame.height/2
        self.backgroundColor = .actionColor
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 2
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}
