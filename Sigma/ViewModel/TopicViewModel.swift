//
//  TopicViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TopicViewModel {
    let title: String
    let posts: [Post]?
    
    init(topic: Topic) {
        self.title = topic.title
        self.posts = topic.posts
    }
    
}
