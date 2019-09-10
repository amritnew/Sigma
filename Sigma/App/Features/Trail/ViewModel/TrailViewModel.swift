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
    
    init(trail: Trail) {
        self.title = trail.title
        self.author = trail.author
        self.topics = trail.topics
    }
    
    func numberOfRows() -> Int {
        return topics?.count ?? 0
    }
    
    func createPostAtTrail() {
        
    }
    
}
