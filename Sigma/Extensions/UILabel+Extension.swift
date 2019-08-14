//
//  UILabel+Extension.swift
//  Sigma
//
//  Created by Matheus Damasceno on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(text: String, textColor: UIColor, font: UIFont?, numberOfLines: Int?, lineBreakMode: NSLineBreakMode?) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.textColor = textColor
        self.font = font
        
        if let lines = numberOfLines {
            self.numberOfLines = lines
        }
        
        if let lineBreak = lineBreakMode {
            self.lineBreakMode = lineBreak
        }
    }
    
}
