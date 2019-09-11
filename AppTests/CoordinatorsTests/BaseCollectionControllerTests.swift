//
//  BaseCollectionControllerTests.swift
//  AppTests
//
//  Created by Guilherme Araujo on 11/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import XCTest
@testable import Sigma

class BaseCollectionControllerTest: XCTestCase {
    let flowLayout =  UICollectionViewFlowLayout()
    let baseCollection  = BaseCollectionController()
    
    func baseCollectionTest() {
        XCTAssertEqual(baseCollection, UICollectionViewController())
    }
}
