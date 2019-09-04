//
//  FeedPostViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct FeedPostViewModel {
    
    var posts: [Post]?
    
    mutating func fetchPosts(completion: @escaping ([Post]) -> Void) {
        PostService.getPost(completion: { (posts) in
            completion(posts)
        })
    }
    
    
}
