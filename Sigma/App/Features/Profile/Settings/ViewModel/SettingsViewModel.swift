//
//  SettingsViewModel.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 18/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation

class SettingsViewModel: ConfigurableViewModel {
    var updateList: UpdateClosure?
    
    private var options:[String] = ["Language App","Logout"]
    
    public func numberOfRows() -> Int {
        return options.count
    }
    
    public func optionFromIndexPath(indexPathRow: Int) -> String {
        let option = options[indexPathRow]
        return option
    }
}
