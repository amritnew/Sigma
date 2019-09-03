//
//  NewPostViewModel.swift
//  Sigma
//
//  Created by Mario Matheus on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation


struct NewPostViewModel {
    
    var viewTitle: String
    
    var markdownText = "# Title\n\n### Overview\n"
    
    init(viewTitle title: String) {
        viewTitle = title
    }
    
}
