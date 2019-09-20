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
        self.setTitle("daojndojas", for: .normal)
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
        self.backgroundColor = .orange
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        self.layer.borderWidth = 2
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}
