//
//  ContainerViewModel.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 23/09/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

struct ContainerViewModel {
    
    private let options:[String] = OptionsProfile.getArrayAllCases()
    
    func numberOfItens() -> Int {
        return options.count
    }
    
    private func getCellType<T: ContainerRowCell>(withIndexPathRow index: Int) -> T.Type? {
        let option = OptionsProfile.getOption(withIndex: index)
        
        switch option {
        case .about:
            return SettingsView.self as? T.Type
        case .myPosts:
            return BookmarkContentCell.self as? T.Type
        case .myTrails:
            return BookmarkContentCell.self as? T.Type
        case .settings:
            return SettingsView.self as? T.Type
        }
    }
    
    func cellForItem<T: ContainerActionsDelegate >(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath, view:T ) -> UICollectionViewCell {
        guard let type = getCellType(withIndexPathRow: indexPath.row) else { fatalError("Not registered") }
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: type)
        cell.containerDelegate = view
        
        return cell
    }
    
    func instantiateViewController(fromSettingsOption option:SettingsOptions) -> UIViewController {
        switch option {
        case .language:
            let viewController = TestViewController()
            return viewController
        case .logout:
            let viewController = TestViewController()
            return viewController
        }
    }
}
