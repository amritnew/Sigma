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
    static let background = UIColor(named: "Background") ?? #colorLiteral(red: 0.1513097882, green: 0.1609947681, blue: 0.1695014536, alpha: 1)
    static let subBackground = UIColor(named:"SubBackground") ?? #colorLiteral(red: 0.1411764706, green: 0.1647058824, blue: 0.2196078431, alpha: 1)
    static let foreground = UIColor(named:"Foreground") ?? #colorLiteral(red: 0.99598068, green: 0.9961469769, blue: 0.9959587455, alpha: 1)
    static let actionColor = UIColor(named:"Accent") ?? #colorLiteral(red: 0.8431372549, green: 0.2431372549, blue: 0.2941176471, alpha: 1)
    static let subText = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
}
