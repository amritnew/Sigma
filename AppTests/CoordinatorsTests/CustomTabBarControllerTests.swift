//
//  CustomTabBarControllerTests.swift
//  AppTests
//
//  Created by Guilherme Araujo on 11/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit
import XCTest
@testable import Sigma


class CustomTabBarControlllerTest: XCTestCase {
    
    
    let shouldSelected = UIViewController()
    let customTabBar = CustomTabBarController()
    
    func testTabBarControllerCaseTrue() {
        let caseTrue = customTabBar.tabBarController(customTabBar, shouldSelect: customTabBar.viewControllers?[1] ?? shouldSelected)
        XCTAssertTrue(caseTrue)
    }
    
    func testTabBarControllerCaseFalse() {
        let caseFalse = customTabBar.tabBarController(customTabBar, shouldSelect: customTabBar.viewControllers?[2] ?? shouldSelected)
        XCTAssertFalse(caseFalse)
    }

}
