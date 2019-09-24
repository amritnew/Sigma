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
    
    lazy var tabView: TabView = {
        let view = TabView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()
    
    let tabViewModel = TabViewModel()
    
    var profileController:ProfileController?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstSelected()
        setupCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        view = tabView
    }
}

extension TabController: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    func setupCollection() {
        tabView.collectionView.register(cellType: TabCollectionCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        profileController?.scrollContainerTo(row: indexPath.row)
        collectionView.cellForItem(at: indexPath)?.isSelected = true
    }
    
    func firstSelected() {
        let index = IndexPath(item: 0, section: 0)
        tabView.collectionView.selectItem(at: index, animated: true, scrollPosition: .init())
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabViewModel.numberOfItens()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: TabCollectionCell.self)
        cell.labelCell.text = tabViewModel.option(fromIndexPathRow: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return CGSize(width: 16 , height: collectionView.frame.height)
        }
        let numberOfRows = CGFloat(tabViewModel.numberOfItens())
        let numbersOfSpacing = numberOfRows - 1
    
        
        let spacingCells = layout.minimumLineSpacing
        let widthCell = (width - (numbersOfSpacing * spacingCells)) / numberOfRows
        
        return CGSize(width: widthCell , height: collectionView.frame.height)
    }
}
