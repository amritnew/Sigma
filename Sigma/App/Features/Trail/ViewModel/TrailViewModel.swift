//
//  TopicViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TrailViewModel {
    let title: String
    let author: String
    let topics: [Topic]?
    let trailId: Int64?
    
    init(trail: Trail) {
        self.title = trail.title
        self.author = trail.author
        self.topics = trail.topics
        self.trailId = trail.trailId
    }
    
    func numberOfRows() -> Int {
        if topics?.count == 0 {
            return 0
        }
        return topics?[0].posts?.count ?? 0
    }
    
    func cellViewModel(forIndex index: Int) -> PostCellViewModel {
        if topics?.count == 0 {
            return PostCellViewModel(Post(title: "Swift", markdownText: "## Basic"))
        }
        guard let post = topics?[0].posts?[index] else {return PostCellViewModel(Post(title: "Swift", markdownText: "## Basic")) }
        return PostCellViewModel(post)
    }
    
    func getPost(forIndex index: Int) -> Post {
        if topics?.count == 0 {
            return Post(title: "Swift", markdownText: "## Basic")
        }
        guard let post = topics?[0].posts?[index] else {return Post(title: "Swift", markdownText: "## Basic") }
        return post
    }
}
