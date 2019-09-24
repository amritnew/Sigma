//
//  ContainerViewModel.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

struct ContainerViewModel {
    
    private let options:[String] = OptionsProfile.getArrayAllCases()
    
    func instantiateViewController(fromSettingsOption option:SettingsOptions) -> UIViewController {
        switch option {
        case .language:
            let viewController = TestViewController()
            return viewController
        case .logout:
            let viewController = TestViewController()
            return viewController
        }
    }
}
