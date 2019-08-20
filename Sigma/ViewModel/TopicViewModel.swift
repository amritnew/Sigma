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
    
    init(topic: Topic) {
        self.title = topic.title
    }
    
}
