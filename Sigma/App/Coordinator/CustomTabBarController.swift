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
        delegate = self
        setupTabBar()
    }

    func showControllerModal(_ viewController: UIViewController) {
        present(viewController, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
}

extension CustomTabBarController: ConfigurableTabBar, UITabBarControllerDelegate {
    fileprivate func setupTabBar() {
        self.viewControllers = [
            createNavigation(viewController: ListTrailsController(), title: "Home", imageNamed: "tab1"),
              createNavigation(viewController: FeedPostController(), title: "Posts", imageNamed: "tab4"),
              createNavigation(viewController: UIViewController(), title: "New", imageNamed: "tab3"),
            createNavigation(viewController: BookMarksController(), title: "Bookmarks", imageNamed: "tab2"),
                        createNavigation(viewController: ProfileController(), title: "Profile", imageNamed: "profile")
        ]
        tabBar.tintColor = .actionColor
        tabBar.barTintColor = .background
        tabBar.isTranslucent = false
    }
    
    fileprivate func createNavigation(viewController: UIViewController, title: String, imageNamed: String) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "foreground") ?? .foreground]
        navigation.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "foreground") ?? .foreground]
        navigation.navigationBar.tintColor = .green
        viewController.view.backgroundColor =  .subBackground
        navigation.navigationBar.barTintColor = .background
        navigation.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(named: imageNamed)
        return navigation
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if tabBarController.viewControllers?.firstIndex(of: viewController) != 2 { return true }
        
        let actionSheet = UIAlertController.buildActionSheet(title: "Time to create", message: "You can create a new trail or a new blog post to share")
        actionSheet.addActions(actions: [
            UIAlertAction(title: "Make a Trail", style: .default) { [weak self] _ in self?.showControllerModal(UINavigationController(rootViewController: NewTrailController())) },
            UIAlertAction(title: "Write a Post", style: .default) { [weak self] _ in self?.showControllerModal(UINavigationController(rootViewController: NewPostController())) },            
            UIAlertAction(title: "Cancel", style: .destructive) { _ in print("Cancel Pressed") }
        ])
        
        present(actionSheet, animated: true, completion: nil)
        
        return false
    }
    
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
