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
    func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UIViewController
}

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBar()
    }

    func showControllerModal(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
}

extension CustomTabBarController: ConfigurableTabBar, UITabBarControllerDelegate {
    fileprivate func setupTabBar() {
        self.viewControllers = [
            createNavigation(viewController: CreatorController(), title: "Home", imageNamed: "tab1"),
              createNavigation(viewController: FeedPostController(), title: "Posts", imageNamed: "tab4"),
             createNavigation(viewController: CreatorController(), title: "Creator", imageNamed: "tab3"),
            createNavigation(viewController: BookMarksController(), title: "Bookmarks", imageNamed: "tab2"),
                        createNavigation(viewController: ProfileController(), title: "Profile", imageNamed: "profile")
        ]
        tabBar.tintColor = .actionColor
        tabBar.barTintColor = .subBackground
        tabBar.isTranslucent = false
    }
    
    fileprivate func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UIViewController {
        let navigation = UINavigationController(rootViewController: viewController)
        
        navigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "Foreground") ?? .titleColor]
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "Foreground") ?? .titleColor]
        navigation.navigationBar.tintColor = .green
        viewController.view.backgroundColor =  .backgroundColor
        viewController.navigationItem.title = title
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: imageNamed)
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = .backgroundColor
            navigation.navigationBar.standardAppearance = navBarAppearance
            navigation.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
        
        
        return navigation
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
