//
//  TabControllerDelegate.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

protocol TabControllerDelegate: class {
    func tappedInOption(optionProfile:OptionProfile)
}



enum OptionProfile:Int {
    case about = 0
    case preferredLanguage = 1
    case setting = 2
}

extension OptionProfile {
    func getStringDescription() -> String {
        switch self {
        case .about:
            return "about"
        case .preferredLanguage:
            return "language"
        case .setting:
            return "setting"
        }
    }
}
