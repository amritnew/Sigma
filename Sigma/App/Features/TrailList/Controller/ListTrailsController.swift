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
    
    weak var scrollDelegate:CustomScrollDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        bindViewModel()
    }
    
    fileprivate func bindViewModel() {
        self.trailViewModel.updateList = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        bindViewModel()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
