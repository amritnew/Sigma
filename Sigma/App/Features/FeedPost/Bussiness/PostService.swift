//
//  PostService.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct PostService {
    static func getPost(completion: @escaping ([Post]) -> Void) {
        Service<[Post]>().get(url: "https://raftel.herokuapp.com/blogposts") { (result) in
            switch result {
            case .failure(let failure):
                print(failure)
            case .success(let post):
                completion(post)
            }
        }
        
    }
}
