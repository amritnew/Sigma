//
//  TrailsCellViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

public struct TrailsCellViewModel {
    
    var trail: Trail?
    
    init(_ trail: Trail) {
        self.trail = trail
    }
}
