//
//  TrailViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class TrailsViewModel: ConfigurableViewModel {
    
    private let service = TrailService()
    
    private var trails: [TrailsCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateList?()
            }
        }
    }
    
    public var updateList: UpdateClosure?
    
    public func numberOfRows() -> Int {
    if self.trails.count == 0 {
        self.fetchData()
    }
        return self.trails.count
    }
    
    private func fetchData() {
        self.service.getTrails(completion: {
            self.trails = $0.map({TrailsCellViewModel($0)})
        })
    }
    
    public func cellViewModel(forIndex index: Int) -> TrailsCellViewModel {
        if index < self.trails.count {
            return self.trails[index]
        }
        return TrailsCellViewModel(Trail(title: "", description: "", author: "", topics: nil))
    }
    
    public func getTrail(forIndex index: Int) -> Trail {
        let trailVM = self.cellViewModel(forIndex: index)
        return trailVM.trail ?? Trail(title: "", description: "", author: "", topics: nil)
    }
}
