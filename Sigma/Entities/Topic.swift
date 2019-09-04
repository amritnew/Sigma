//
//  Topic.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Topic: Codable {
    let title: String
    let posts: [Post]?
    
    enum CodingKeys: String, CodingKey {
        case title = "topic_name"
        case posts = "blog_posts"
    }
}
