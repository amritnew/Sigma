//
//  PostViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct PostViewModel {
    let title: String
    let markdownText: String
    var post: Post!
    
    init(post: Post) {
        self.title = post.title
        self.markdownText = post.markdownText
    }
}
