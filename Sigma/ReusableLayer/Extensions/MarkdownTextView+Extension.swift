//
//  MarkdownTextView+Extension.swift
//  Sigma
//
//  Created by Mario Matheus on 02/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import Markdowner

extension MarkdownTextView {

    convenience init(fontSize size: CGFloat = 12) {
        self.init(frame: .zero)
        // self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.translatesAutoresizingMaskIntoConstraints = false
        self.keyboardDismissMode = .none
        self.backgroundColor = .clear
        self.setStyleConfigurationWith(
            font: UIFont.systemFont(ofSize: size),
            textColor: .foreground,
            symbolsColor: .lightGray)
    }
    
    func setStyleConfigurationWith(font: UIFont, textColor: UIColor, symbolsColor: UIColor) {
        self.stylesConfiguration = StylesConfiguration(
            baseFont: font,
            textColor: textColor,
            symbolsColor: symbolsColor,
            useDynamicType: true)
    }

}
