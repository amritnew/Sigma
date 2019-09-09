//
//  BookmarkCellViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 08/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct BookmarkCellViewModel {
    
    let favoritePost: FavoritePost?
    
    init(_ favoritePost: FavoritePost) {
        self.favoritePost = favoritePost
    }
    
    
}
