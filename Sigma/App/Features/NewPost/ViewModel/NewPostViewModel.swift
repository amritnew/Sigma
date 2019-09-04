//
//  NewPostViewModel.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreGraphics


struct NewPostViewModel {
    
    var viewTitle: String
    var fontSize: CGFloat = 18
    var previewing = false
    
    var markdownText = "# Title\n\n### Overview\n"
    
    init(viewTitle title: String) {
        viewTitle = title
    }
    
    func saveBlogPost(title: String, completion: @escaping (Bool) -> Void) {
        let service = NewPostService.main
        service.create(post: Post(title: title, markdownText: markdownText)) { (post, _) in
            guard post != nil else { return completion(false) }
            completion(true)
        }
    }
    
}
