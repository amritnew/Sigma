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
    struct AppColors{
        static let Background = UIColor(named: "Background") ?? #colorLiteral(red: 0.1513097882, green: 0.1609947681, blue: 0.1695014536, alpha: 1)
        static let SubBackground = UIColor(named:"SubBackground") ?? #colorLiteral(red: 0.2063391209, green: 0.2157810032, blue: 0.232970953, alpha: 1)
        static let Foreground = UIColor(named:"Foreground") ?? #colorLiteral(red: 0.99598068, green: 0.9961469769, blue: 0.9959587455, alpha: 1)
        static let ActionColor = UIColor(named:"Accent") ?? #colorLiteral(red: 0.1198671684, green: 0.348572433, blue: 0.9689067006, alpha: 1)
    }
}
