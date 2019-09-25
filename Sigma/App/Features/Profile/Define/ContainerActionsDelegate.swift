//
//  ContainerActionsDelegate.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ContainerActionsDelegate: ContainerCollectionViewCell {
    func tappedInSettings(withOption option:SettingsOptions)
}
