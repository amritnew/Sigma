//
//  NewTrailViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 07/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct NewTrailViewModel {
    
    func saveTrail(with title: String, with description: String, completion: @escaping (Bool) -> Void) {
        TrailService().create(trail: Trail(title: title, description: description, author: "Provisional Author", topics: nil)) { (trail, _) in
            guard trail != nil else {return completion(false)}
            completion(true)
        }
    }
}
