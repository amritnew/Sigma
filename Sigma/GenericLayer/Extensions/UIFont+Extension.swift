//
//  UIFont+Extension.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

extension UIFont {
    convenience init?(font: Font, size: CGFloat) {
        switch font {
        case .mediumSystem:
            let fontName = UIFont.systemFont(ofSize: size, weight: .medium).fontName
            self.init(name: fontName, size: size)
        case .boldSystem:
            let fontName = UIFont.systemFont(ofSize: size, weight: .bold).fontName
            self.init(name: fontName, size: size)
        default:
            self.init(name: font.rawValue, size: size)
        }
    }
}

enum Font: String {
    case arial = "Arial"
    case futura = "futura"
    case mediumSystem = "1"
    case boldSystem = "2"
}
