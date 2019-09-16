//
//  TabController.swift
//  Sigma
//
//  Created by Alan Victor Paulino de Oliveira on 20/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class TabController: UIViewController {
    
    weak var delegate:TabControllerDelegate?
    
    lazy var tabView:TabView = {
        let view = TabView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()
    
    var itensTab:[String]?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(itensTab:[String]) {
        self.init(nibName: nil, bundle: nil)
        self.itensTab = itensTab
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        view = TabView()
    }
}

extension TabController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource, UICollectionViewDelegate {
    fileprivate func setupCollection() {
        tabView.collectionView.register(TabCollectionCell.self, forCellWithReuseIdentifier: "cellId")
        if let layout = tabView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.estimatedItemSize = CGSize(width: 1, height: 1)
            layout.minimumLineSpacing = 16
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let option = OptionsProfile(rawValue: indexPath.row) else {return}
        delegate?.tappedInOption(optionProfile: option)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itensTab?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as? TabCollectionCell
        cell?.labelCell.text = itensTab?[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 16, height: collectionView.frame.height)
    }
}
