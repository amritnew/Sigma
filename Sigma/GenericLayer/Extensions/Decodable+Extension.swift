//
//  Decodable.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 17/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

extension Decodable {
    static func className() -> String {
        return String(describing: self)
    }
}
