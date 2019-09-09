//
//  ConfigurableViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

protocol ConfigurableViewModel: class {
    
    typealias UpdateClosure = () -> Void
    var updateList: UpdateClosure? { get }
}
