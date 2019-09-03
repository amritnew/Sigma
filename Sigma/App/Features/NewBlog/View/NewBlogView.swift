//
//  NewBlogView.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit


class NewBlogView: UIView, ConfigurableView {
    
    var viewModel: NewBlogViewModel?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewModel = NewBlogViewModel(viewTitle: "Trails")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    
}
