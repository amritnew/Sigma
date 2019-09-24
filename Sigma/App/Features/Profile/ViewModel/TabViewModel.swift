//
//  TabViewModel.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 24/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

struct TabViewModel {
    private var options:[String] = OptionsProfile.getArrayAllCases()
    
    func numberOfItens() -> Int {
        return options.count
    }
    
    func option(fromIndexPathRow index: Int) -> String {
        return options[index]
    }
}
