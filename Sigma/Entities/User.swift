//
//  User.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct User: Decodable {
    let name: String
    let photoUrl: String?
    let trails: [Trail]?
}
