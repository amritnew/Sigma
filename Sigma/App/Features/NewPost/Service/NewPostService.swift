//
//  NewPostService.swift
//  Sigma
//
//  Created by Mario Matheus on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation


class NewPostService {
    
    private let basePath = "https://raftel.herokuapp.com"
    private let blogPostPath = "/blogposts"
    private let trailsPath = "/trails"
    
    static let main = NewPostService()
    private init() {}
    
    func create(post: Post, completion: @escaping (Post?, NewPostServiceError?) -> Void) {
        let params = [
            "title" : "\(post.title)",
            "author" : "Shichibukais",
            "markdown_text" : "\(post.markdownText)"
        ]
        Service<Post>().post(params: params, url: "\(basePath)\(blogPostPath)") { result in
            switch result {
            case .failure:
                return completion(nil, NewPostServiceError.postNotCreated)
            case .success(let post):
                return completion(post, nil)
            }
        }
    }
    
    
    func associate(post: Post, at trail: Trail, completion: @escaping (Trail?, NewPostServiceError?) -> Void) {
        guard let trailId = trail.trailId else { return completion(nil, NewPostServiceError.trailWithoutId) }
        let params = [
            "blog_post_id" : "\(post.title)",
            "topic_name" : "Any topic"
        ]
        Service<Trail>().post(params: params, url: "\(basePath)\(trailsPath)\(trailId)") { result in
            switch result {
            case .failure:
                return completion(nil, NewPostServiceError.postNotAssociated)
            case .success(let trail):
                return completion(trail, nil)
            }
        }
    }
    
}

enum NewPostServiceError: Error {
    case postNotCreated
    case postNotAssociated
    case trailWithoutId
}
