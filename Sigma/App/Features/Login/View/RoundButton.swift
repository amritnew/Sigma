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
    }
    
    convenience init(textButton: String) {
        self.init(frame: .zero)
        self.setTitle(textButton, for: .normal)
        self.titleLabel?.textColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        didSetupLayout()
    }
    
    fileprivate func didSetupLayout() {
        self.layer.cornerRadius = self.frame.height/2
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 2
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        setGradientBackground()
    }
    
    func setGradientBackground() {
        let colorTop = #colorLiteral(red: 1, green: 0.1679200795, blue: 0.3508474514, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.7701123953, green: 0.1351309419, blue: 0.2727455795, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = layer.cornerRadius + 5
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        layer.insertSublayer(gradientLayer, at:0)
    }
}
