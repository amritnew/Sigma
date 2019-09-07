//
//  TrailViewModel.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class TrailsViewModel: ConfigurableViewModel {
    
    public typealias UpdateClosure = () -> Void
    
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
        let rows = self.trails.count
        
        if rows == 0 {
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
}
