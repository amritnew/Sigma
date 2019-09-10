//
//  FavoritePost+Properties.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 08/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import Foundation
import CoreData


extension FavoritePost {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritePost> {
        return NSFetchRequest<FavoritePost>(entityName: "FavoritePost")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var markdownText: String?
    
}
