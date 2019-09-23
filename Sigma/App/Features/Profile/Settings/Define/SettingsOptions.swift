//
//  SettingsOptions.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation


enum SettingsOptions: String, CaseIterable {
    case language = "Language App"
    case logout = "Logout"
}

extension SettingsOptions {
    static func getArrayAllCases() -> [String] {
        var settings = [String]()
        for type in SettingsOptions.allCases {
            settings.append(type.rawValue)
        }
        return settings
    }
    
    static func getCase(withIndex index: Int) -> SettingsOptions {
        let options = SettingsOptions.allCases
        return options[index]
    }
}
