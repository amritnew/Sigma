//
//  ProfileController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ProfileController: UICollectionViewController {
    var selectedOption:OptionsProfile = .about
    
    lazy var heightHeader = self.view.frame.height / 2.5
    
    init() {
        super.init(collectionViewLayout: StretchHeaderFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        self.view.backgroundColor = UIColor.yellow
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

extension ProfileController: UICollectionViewDelegateFlowLayout {
    fileprivate func setupCollection() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            
        }
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(HeaderProfileCollection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView.register(cellType: MenuBarCollectionViewCell.self)
        collectionView.register(cellType: ContainerCollectionViewCell.self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 2.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as? HeaderProfileCollection
        headerView?.delegate = self
        
        return headerView ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 64)
        }
        
        return CGSize(width: view.frame.width , height: view.frame.height - 96)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
             let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: MenuBarCollectionViewCell.self)
            cell.menuBar?.profileController = self
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ContainerCollectionViewCell.self)
        cell.scrollDelegate = self
        cell.profileDelegate = self
        return cell
    }
    
    func scrollContainerTo(row:Int) {
        let indexPath = IndexPath(row: 1, section: 0)
        
        if let container = collectionView.cellForItem(at: indexPath) as? ContainerCollectionViewCell {
            container.collectionView.scrollToItem(at: IndexPath(item: row, section: 0), at: .init(), animated: true)
        }
        
    }
    
}

extension ProfileController:HeaderProfileDelegate {
    func wasSelectedOption(option: OptionsProfile) {
        selectedOption = option
        self.collectionView.reloadData()
    }
}

extension ProfileController: CustomScrollDelegate {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
//        let offSetYCollection = collectionView.contentOffset.y
//
//        print(offSetYCollection)
    }
    
    private func scrollToBottom() {
        
        guard let countSectionIndex = collectionView?.numberOfSections else { return }
        let lastSectionIndex = countSectionIndex - 1
        let lastItemIndex = collectionView.numberOfItems(inSection: lastSectionIndex) - 1
        let indexPath = IndexPath(item: lastItemIndex, section: lastSectionIndex)
        
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
}

extension ProfileController: ProfileDelegate {
    func presentModally(viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
}
