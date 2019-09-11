//
//  UIColor+Extension.swift
//  Sigma
//
//  Created by Guilherme Araujo on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let background = UIColor(named: "Background") ?? #colorLiteral(red: 0.06274509804, green: 0.07450980392, blue: 0.1019607843, alpha: 1)
    static let subBackground = UIColor(named:"SubBackground") ?? #colorLiteral(red: 0.05882352941, green: 0.07843137255, blue: 0.1254901961, alpha: 1)
    static let foreground = UIColor(named:"Foreground") ?? #colorLiteral(red: 0.99598068, green: 0.9961469769, blue: 0.9959587455, alpha: 1)
    static let actionColor = #colorLiteral(red: 0.5450980392, green: 0.05882352941, blue: 0.05882352941, alpha: 1)
    static let subText = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
}
