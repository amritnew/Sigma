//
//  CustomTabBarController.swift
//  Sigma
//
//  Created by Vinicius Mangueira on 31/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

private protocol ConfigurableTabBar {
    func setupTabBar()
    func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController
}

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

extension CustomTabBarController: ConfigurableTabBar {
    fileprivate func setupTabBar() {
        self.viewControllers = [createNavigation(viewController: ListTrailsController(), title: "Home", imageNamed: "tab1"), createNavigation(viewController: MyTrailsController(), title: "My Trail", imageNamed: "tab2"),
            createNavigation(viewController: ProfileController(), title: "Profile", imageNamed: "profile")]
        tabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tabBar.layer.cornerRadius = 16
        tabBar.layer.masksToBounds = true
    }
    
    fileprivate func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor =  .white
        navigation.navigationBar.barTintColor = .white
        navigation.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: imageNamed)
        return navigation
    }
}
