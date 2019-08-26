//
//  TrailViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TrailViewModel {
    let title: String
    let topic: [Topic]
    
    init(trail: Trail) {
        self.title = trail.title
        self.topic = trail.topics
    }
    
}
