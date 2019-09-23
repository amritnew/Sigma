//
//  DataHandler.swift
//  Sigma
//
//  Created by aluno on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

struct DataHandler {
    static func transform(image: UIImage) -> Data? {
        return image.pngData()
    }
}
