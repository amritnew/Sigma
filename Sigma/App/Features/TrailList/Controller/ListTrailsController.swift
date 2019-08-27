//
//  ViewController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 31/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ListTrailsController: BaseCollectionController {

    var trailViewModel = TrailsViewModel()
    let trails = [Trail(title: "Swift", description: "Basic Swift, Learning the new things about the awesome language.", author: "Vinicius", topics: [Topic(title: "Generics", posts: nil)]),Trail(title: "Java Script", description: "Basics JS", author: "Mario", topics: [Topic(title: "Generics", posts: nil)])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        bindViewModel()
        trailViewModel.trails = trails
    }
    
    fileprivate func bindViewModel() {
            trailViewModel.fetchTrail()
        }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
