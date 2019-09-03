//
//  ProfileController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 14/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class ProfileController: BaseCollectionController {
    var selectedOption:OptionProfile = .about
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        self.view.backgroundColor = UIColor.yellow
        navigationController?.navigationBar.isHidden = true
    }
}

extension ProfileController: UICollectionViewDelegateFlowLayout {
    fileprivate func setupCollection() {
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(AboutCollectionViewCell.self, forCellWithReuseIdentifier: OptionProfile.about.getStringDescription())
        collectionView.register(PreferredLanguagesCollectionViewCell.self, forCellWithReuseIdentifier: OptionProfile.preferredLanguage.getStringDescription())
        collectionView.register(ProfileCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height / 2.5)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as? ProfileCollectionHeader
        headerView?.delegate = self
        
        return headerView ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: selectedOption.getStringDescription(), for: indexPath)
        
        return cell
    }
    
}

extension ProfileController:HeaderProfileDelegate {
    func wasSelectedOption(option: OptionProfile) {
        selectedOption = option
        self.collectionView.reloadData()
    }
}