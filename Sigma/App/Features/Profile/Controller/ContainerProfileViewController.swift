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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContainerProfileViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        var index:Int = 0
        guard let viewControllerIndex = optionProfilesViewControllers.firstIndex(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard optionProfilesViewControllers.count > previousIndex else { return nil }
        
        return optionProfilesViewControllers[previousIndex]
        
//        if currentPage == 0 {
//            index = optionProfilesViewControllers.count - 1
//        } else {
//            index = currentPage - 1
//        }
//        return optionProfilesViewControllers[index]
//
//        pageViewController.c
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = optionProfilesViewControllers.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < optionProfilesViewControllers.count else { return nil }
        
        guard optionProfilesViewControllers.count > nextIndex else { return nil }
        
        return optionProfilesViewControllers[nextIndex]
        
//        var index:Int = 0
//        if currentPage == optionProfilesViewControllers.count - 1 {
//            index = 0
//        } else {
//            index = currentPage + 1
//        }
//        return optionProfilesViewControllers[index]
    }
    
    
}
