//
//  ServiceTests.swift
//  AppTests
//
//  Created by Vinicius Mangueira on 27/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import XCTest
@testable import Sigma

class ServiceTests: XCTestCase {

    struct Post: Decodable {let title: String?}
    
    var trailViewModel = TrailsViewModel()
    
    func testStubViewModel() {
//        trailViewModel.trails = [Trail(title: "Mock", description: "This is mock", author: "Mockado", topics: [Topic(title: "Mock", posts: nil)])]
//        
//        //trailViewModel?.fetchTrail() where API ended test here
//        XCTAssertNotNil(trailViewModel.trails)
    }
    
    func testService() {
        Service<[Post]>().get(url: "https://jsonplaceholder.typicode.com/posts") { (result) in
            switch result {
                
            case .failure(let error):
                XCTAssertNotNil(error)
               
            case .success(let post):
                XCTAssertNotNil(post)
            }
        }
    }
    
    func testExample() {}
    
    func testPerformanceExample() {
        self.measure {
        }
    }
    
}
