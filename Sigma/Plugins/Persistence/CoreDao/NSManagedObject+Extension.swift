//
//  NSManagedObject+Extension.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 08/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

extension NSManagedObject {
    static var className: String {
        return String(describing: self)
    }
}
