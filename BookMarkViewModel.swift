//
//  MyTrailsViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 08/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class BookMarkViewModel: ConfigurableViewModel {
    
    var updateList: UpdateClosure?
    
    private let coreDao = CoreDao<FavoritePost>(with: "SigmaContainer")
    
    
    private var posts: [BookmarkCellViewModel] = [] {
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
        self.posts = coreDao.fetchAll().map({BookmarkCellViewModel($0)})
    }
    
    public func cellViewModel(forIndex index: Int) -> BookmarkCellViewModel {
        
        if index < self.posts.count {
            return self.posts[index]
        }
        
        return BookmarkCellViewModel(FavoritePost())
    }
    
    public func performPostAtFavorite(forIndex index: Int) -> Post {
        let postCellVM = cellViewModel(forIndex: index)
        let post = Post(title: postCellVM.favoritePost?.title ?? "Empty", markdownText: postCellVM.favoritePost?.markdownText ?? "Empty")
        return post
    }
    
}
