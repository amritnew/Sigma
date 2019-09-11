//
//  TrailService.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 26/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TrailService {
    
    private let basePath = "https://raftel.herokuapp.com"
    private let blogPostPath = "/blogposts"
    private let trailsPath = "/trails"
    
    func create(trail: Trail, completion: @escaping (Trail?, TrailServiceError?) -> Void) {
        let params = [
            "author" : "Shichibukais",
            "title" : "\(trail.title)"
        ]
        
        Service<Trail>().post(params: params, url: "\(basePath)\(trailsPath)") { (result) in
            switch result {
            case .failure:
                    completion(nil, TrailServiceError.trailNotCreated)
            case .success(let trail):
                    completion(trail, nil)
            }
        }
    }
    
    func getTrails(completion: @escaping ([Trail]) -> Void) {
        Service<[Trail]>().get(url: "\(basePath)\(trailsPath)") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let trail):
                completion(trail)
            }
        }
    }
}


enum TrailServiceError: Error {
    case trailNotCreated
    case trailWithoutAuthor
}
