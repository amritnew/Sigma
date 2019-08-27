//
//  TrailService.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 26/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TrailService {
    
    func getTrails(completion: @escaping ([Trail]) -> Void) {
        Service<[Trail]>().get(url: "") { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let trail):
                completion(trail)
            }
        }
    }
}
