//
//  OptionsProfile.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

enum OptionsProfile:Int {
    case about = 0
    case myTrails = 1
    case settings = 2
}

extension OptionsProfile {
    func getStringDescription() -> String {
        switch self {
        case .about:
            return "about"
        case .myTrails:
            return "myTrails"
        case .settings:
            return "settings"
        }
    }
    
//    func typeViewController<T: UIViewController>() -> T.Type {
//        switch self {
//        case .about:
//            return AboutViewController.self as! T.Type
//        default:
//            return AboutViewController.self as! T.Type
//            }
//        }
}
