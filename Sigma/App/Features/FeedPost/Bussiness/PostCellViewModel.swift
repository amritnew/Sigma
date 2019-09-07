//
//  PostViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct PostCellViewModel {
    public let post: Post?
    
    init(_ post: Post) {
        self.post = post
    }
    
}
