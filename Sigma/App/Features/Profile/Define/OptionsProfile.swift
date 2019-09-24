//
//  OptionsProfile.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

enum OptionsProfile: String,CaseIterable {
    case about = "About"
    case myTrails = "My Trails"
    case myPosts = "My Posts"
    case settings = "Settings"
}

extension OptionsProfile {
    static func getArrayAllCases() -> [String] {
        var options = [String]()
        for type in OptionsProfile.allCases {
            options.append(type.rawValue)
        }
        return options
    }
//    func getStringDescription() -> String {
//        switch self {
//        case .about:
//            return "about"
//        case .myTrails:
//            return "myTrails"
//        case .settings:
//            return "settings"
//        }
//    }
    
//    func typeViewController<T: UIViewController>() -> T.Type {
//        switch self {
//        case .about:
//            return AboutViewController.self as! T.Type
//        default:
//            return AboutViewController.self as! T.Type
//            }
//        }
}
