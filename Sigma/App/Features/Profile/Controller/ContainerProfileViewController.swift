//
//  ContainerProfileViewController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 03/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

protocol ChangePageDelegate: class {
    func changePage(pgIndex: Int)
}

class ContainerProfileViewController: UIPageViewController {
    
    var currentPage = 1
    
    lazy var optionProfilesViewControllers:[UIViewController] = {
        let about = newViewController(withIdentifier: .about) as? AboutViewController
        let myTrails = newViewController(withIdentifier: .myTrails) as? MyTrailsViewController
        let settings = newViewController(withIdentifier: .settings) as? SettingsViewController
        return [about!, myTrails!, settings!]
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setViewController(index: 0)
        self.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func newViewController(withIdentifier type:OptionsProfile) -> UIViewController {
        switch type {
        case .about:
            return AboutViewController()
        case .myTrails:
            return MyTrailsViewController()
        case .settings:
            return SettingsViewController()
        }
    }
    
    func setViewController(index:Int) {
        let viewController = optionProfilesViewControllers[index]
        
        var direction: UIPageViewController.NavigationDirection = .forward
        
        if currentPage > index {
            direction = .reverse
        }
        
        setViewControllers([viewController], direction: direction, animated: true, completion: nil  )
    }
}

extension ContainerProfileViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        var index:Int = 0
        guard let viewControllerIndex = optionProfilesViewControllers.firstIndex(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard optionProfilesViewControllers.count > previousIndex else { return nil }
        
        return optionProfilesViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = optionProfilesViewControllers.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < optionProfilesViewControllers.count else { return nil }
        
        guard optionProfilesViewControllers.count > nextIndex else { return nil }
        
        return optionProfilesViewControllers[nextIndex]
    }
    
    
}
