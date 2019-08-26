//
//  Topic.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Topic: Decodable {
    let title: String
    let posts: [Post]?
}
