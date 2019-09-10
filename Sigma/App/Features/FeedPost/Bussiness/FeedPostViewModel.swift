//
//  FeedPostViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 04/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class FeedPostViewModel: ConfigurableViewModel {
    
    var updateList: UpdateClosure?
    
    private let service = PostService()
    
    
    private var posts: [PostCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateList?()
            }
        }
    }
    
    public func numberOfRows() -> Int {
        let rows = self.posts.count
        
        if rows == 0 {
            self.fetchData()
        }
        
        return self.posts.count
        
    }

    private func fetchData() {
        service.getPost { (posts) in
            self.posts = posts.map({PostCellViewModel($0)})
        }
    }
    
    public func cellViewModel(forIndex index: Int) -> PostCellViewModel {
        if index < self.posts.count {
            return self.posts[index]
        }
        
        return PostCellViewModel(Post(title: "", markdownText: ""))
    }
    
    public func getPost(atRow indexPath: Int) -> Post {
        let postVM = self.cellViewModel(forIndex: indexPath)
        return postVM.post ?? Post(title: "", markdownText: "")
    }
    
    
}
