//
//  TrailViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TrailsViewModel {
    
    var trails: [Trail]?
    
    var row: Int = 0 // Initial value at row

    mutating func fetchTrail() {
        var this = self
        TrailService().getTrails { (trails) in
            this.trails = trails
            print("Trails be set from API here: \(trails)")
        }
    }
}
