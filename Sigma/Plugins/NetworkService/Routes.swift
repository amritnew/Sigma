//
//  Routes.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 05/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

protocol Routable {
    var baseUrl: String {get}
    var endPoint: String {get}
}

enum Routes: Routable {
    
    case trails
    case blogPosts
    
    var baseUrl: String {
        return "https://raftel.herokuapp.com/"
    }
    
    var endPoint: String {
        switch self {
        case .trails:
            return "\(baseUrl)trails"
        case .blogPosts:
            return "\(baseUrl)blogposts"
        }
    }
}
