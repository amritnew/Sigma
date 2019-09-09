//
//  Trail.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Trail: Codable {
    var trailId: Int64?
    var title: String
    var description: String? = ""
    var author: String
    var topics: [Topic]?
    
    init(title: String, description: String, author: String, topics: [Topic]?) {
        self.title = title
        self.description = description
        self.author = author
        self.topics = topics
    }
    
    enum CodingKeys: String, CodingKey {
        case trailId = "trail_id"
        case title = "title"
        case description = "description"
        case author = "author"
        case topics = "topics"
    }
}
