//
//  UserViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct UserViewModel {
    let name: String
    let photoUrl: String
    let trails: [Trail]?
    
    init(user: User) {
        self.name = user.name
        self.photoUrl = user.photoUrl ?? ""
        self.trails = user.trails
    }
    
    
}
