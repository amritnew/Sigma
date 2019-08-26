//
//  Trail.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Trail: Decodable {
    let title: String
    let description: String
    let author: String
    let topics: [Topic]
}
