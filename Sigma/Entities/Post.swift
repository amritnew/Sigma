//
//  Post.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct Post: Codable {
    var postId: Int64?
    var title: String
    var markdownText: String
    var provisionalAuthor: String?
    var isFavorited: Bool?
    
    init(title: String, markdownText: String) {
        self.title = title
        self.markdownText = markdownText
    }
    
    enum CodingKeys: String, CodingKey {
        case postId = "blog_post_id"
        case title = "title"
        case markdownText = "markdown_text"
        case provisionalAuthor = "author"
    }
}
