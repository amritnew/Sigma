//
//  TestFeedPost.swift
//  AppTests
//
//  Created by Guilherme Araujo on 13/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

@testable import Sigma

import UIKit
import XCTest


class TestFeedPost: XCTestCase {
    
    let service = PostService()
    var posts: [PostCellViewModel]?
    
    func testGetPostCaseSucess() {
        service.getPost { (posts) in
            self.posts = posts.map({PostCellViewModel($0)})
        }
        XCTAssertNotNil(posts)
    }
    
    func testGetPostCaseSucessStub() {
    
        
    }
    
}
